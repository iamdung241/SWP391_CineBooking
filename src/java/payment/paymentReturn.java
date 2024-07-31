/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package payment;

import dal.SeatDAO;
import dal.ShowtimingDAO;
import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import mail.Mail;
import model.Account;
import model.Concession;
import model.Seat;
import model.Showtiming;
import model.Ticket;

/**
 *
 * @author tranh
 */
public class paymentReturn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet paymentReturn</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet paymentReturn at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }
        String rs = "";
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                rs = "Thành công";
                HttpSession session = request.getSession();
                Account user = (Account) session.getAttribute("user");
                Showtiming show = new ShowtimingDAO().getShowtimingByShowtimeID(Integer.parseInt((String) session.getAttribute("showtime")));
                String seat = (String) session.getAttribute("seat");
                String totalprice = (String) session.getAttribute("price");
                List<Concession> comboList = (List) session.getAttribute("combo");
                List<Seat> seats = new TicketDAO().getSeatBooked(seat);
                String code = generateSecretCode(6) + user.getAccount_id();
                request.setAttribute("code", code);
                LocalDateTime currentDateTime = LocalDateTime.now();
                // Định dạng ngày và giờ theo mẫu mong muốn
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                // Chuyển ngày và giờ hiện tại thành chuỗi đã định dạng
                String formattedDateTime = currentDateTime.format(formatter);
                // Hiển thị ngày và giờ hiện tại
                Ticket newTicket = new Ticket(code, user.getAccount_id(), show.getShowtime_id(), seats, Integer.parseInt(totalprice), comboList, "", formattedDateTime);
                TicketDAO td = new TicketDAO();
                for (Seat seat1 : seats) {
                    System.out.println(seat1.toString());
                }
                int theaterID = (int) session.getAttribute("theaterID");
                td.AddTicket(newTicket, user.getAccount_id(), theaterID);
                session.setAttribute("ticketCode", newTicket.getCode());
                Mail m = new Mail();
                Ticket ti = new TicketDAO().getTicket(code);
                boolean mail = m.sendEmail(user.getEmail(), ti);
                if(mail){
                    request.setAttribute("mail", "Send mail sucess!");
                }else{
                    request.setAttribute("mail", "Send mail fail!");
                }
            } else {
                rs = "Không thành công";
            }
        } else {
            rs = "Invalid signature";
        }
        request.setAttribute("rs", rs);
        request.getRequestDispatcher("/pay/paymentReturn.jsp").forward(request, response);
    }

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    public static String generateSecretCode(int length) {
        Random random = new Random();
        StringBuilder code = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(CHARACTERS.length());
            code.append(CHARACTERS.charAt(index));
        }

        return code.toString();
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
