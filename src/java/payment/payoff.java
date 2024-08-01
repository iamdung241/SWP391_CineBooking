/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package payment;

import dal.AccountDAO;
import dal.MovieDAO;
import dal.ShowtimingDAO;
import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import mail.Mail;
import model.Account;
import model.Concession;
import model.Movie;
import model.Seat;
import model.Showtiming;
import model.Ticket;
import static payment.paymentReturn.generateSecretCode;

/**
 *
 * @author Son
 */
public class payoff extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet payoff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payoff at " + request.getContextPath() + "</h1>");
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
//                TicketDAO td = new TicketDAO();
//                int theaterID = (int) session.getAttribute("theaterID");
//                td.AddTicket(newTicket, user.getAccount_id(), theaterID);
//                session.setAttribute("ticketCode", newTicket.getCode());
//                Mail m = new Mail();
//                Ticket ti = new TicketDAO().getTicket(code);
//                boolean mail = m.sendEmail(user.getEmail(), ti);
//                if(mail){
//                    request.setAttribute("mail", "Send mail sucess!");
//                }else{
//                    request.setAttribute("mail", "Send mail fail!");
//                }
        Movie movie = new MovieDAO().getMovieByID(show.getMovie_id());
        //
        request.setAttribute("ticket", newTicket);
        request.setAttribute("show", show);
        request.setAttribute("user", user);
        request.setAttribute("movie", movie);
        request.getRequestDispatcher("/pay/pay_offline.jsp").forward(request, response);

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
        int theaterID = user.getTheaterID();
        td.AddTicket(newTicket, user.getAccount_id(), theaterID);
        session.setAttribute("ticketCode", newTicket.getCode());
        String rs = "Congratulation! Your ticket is order successfully.";
        request.setAttribute("rs", rs);
        request.getRequestDispatcher("/pay/paymentReturn.jsp").forward(request, response);
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
