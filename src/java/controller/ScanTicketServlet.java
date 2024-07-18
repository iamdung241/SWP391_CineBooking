/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ticket;

/**
 *
 * @author thanh
 */
public class ScanTicketServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScanTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScanTicketServlet at " + request.getContextPath() + "</h1>");
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
        String code = request.getParameter("code");
        TicketDAO ticketDao = new TicketDAO();
        Ticket ticket = ticketDao.getTicket(code);
        if (ticket != null) {
            java.util.Date now = new java.util.Date();
            java.text.SimpleDateFormat sdfDate = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.text.SimpleDateFormat sdfTime = new java.text.SimpleDateFormat("HH:mm");
            String currentDate = sdfDate.format(now);
            String currentTime = sdfTime.format(now);
            String showtimeStr = ticket.getShowtime().getShowtiming();
            String dateShowtime = ticket.getShowtime().getDate();
//            String showtimeWithMinutes = showtimeStr + ":00";
            int showtimeInt = Integer.parseInt(showtimeStr);
            int beforeShowtime = showtimeInt - 2;
            String beforeShowtimeWithMinutes = beforeShowtime + ":00";
            int nextShowtime = showtimeInt + 1;
            String nextShowtimeWithMinutes = nextShowtime + ":00";
            //date showtime on ticket = current date
            //staff can accept ticket equal or after 1h
            boolean showAcceptButton = ticket.getStatus().equals("Nocheck")
                    && dateShowtime.equals(currentDate)
                    && ((currentTime.compareTo(beforeShowtimeWithMinutes) > 0 && currentTime.compareTo(nextShowtimeWithMinutes) < 0));

            request.setAttribute("ticket", ticket);
            request.setAttribute("showAcceptButton", showAcceptButton);
        }
        request.getRequestDispatcher("/views/staff/ScanTicket.jsp").forward(request, response);
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
        String code = request.getParameter("code");
        TicketDAO ticketDao = new TicketDAO();
        Ticket ticket = ticketDao.getTicket(code);

        if (ticket != null && "Nocheck".equals(ticket.getStatus())) {
            java.util.Date now = new java.util.Date();
            java.text.SimpleDateFormat sdfDate = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.text.SimpleDateFormat sdfTime = new java.text.SimpleDateFormat("HH:mm");
            String currentDate = sdfDate.format(now);
            String currentTime = sdfTime.format(now);
            String showtimeStr = ticket.getShowtime().getShowtiming();
            String dateShowtime = ticket.getShowtime().getDate();
            String showtimeWithMinutes = showtimeStr + ":00";
            int showtimeInt = Integer.parseInt(showtimeStr);
            int beforeShowtime = showtimeInt - 2;
            String beforeShowtimeWithMinutes = beforeShowtime + ":00";
            int nextShowtime = showtimeInt + 1;
            String nextShowtimeWithMinutes = nextShowtime + ":00";
            if (dateShowtime.equals(currentDate)
                    && (currentTime.compareTo(beforeShowtimeWithMinutes) > 0 && currentTime.compareTo(nextShowtimeWithMinutes) < 0)) {
                ticketDao.updateTicketStatus(code, "Checked");
                request.setAttribute("message", "Accept ticket successfully");
            } else {
                request.setAttribute("message", "Accepting ticket failed due to time constraints");
            }
        } 
        Ticket t1 = ticketDao.getTicket(code);
        request.setAttribute("ticket", t1);
        request.getRequestDispatcher("/views/staff/ScanTicket.jsp").forward(request, response);
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
