/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ConcessionDAO;
import dal.MovieDAO;
import dal.RoomDAO;
import dal.SeatDAO;
import dal.ShowtimingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Concession;
import model.Movie;
import model.Room;
import model.Seat;
import model.Showtiming;

/**
 *
 * @author thanh
 */
public class SeatsServlet extends HttpServlet {

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
            out.println("<title>Servlet SeatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SeatServlet at " + request.getContextPath() + "</h1>");
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
        SeatDAO sdao = new SeatDAO();
        List<Seat> listSeat;
        String roomID = request.getParameter("roomID");
        MovieDAO moviedao = new MovieDAO();
        ShowtimingDAO showdao = new ShowtimingDAO();
        String movieID = request.getParameter("movieID");
        String showtimeID = request.getParameter("showtimeID");
        try {
            int roomid = Integer.parseInt(roomID);
            int movieid = Integer.parseInt(movieID);
            int showtimeid = Integer.parseInt(showtimeID);
            RoomDAO rdao = new RoomDAO();
            Room room = rdao.getRoomByID(roomid);
            request.setAttribute("room", room);
            listSeat = sdao.getSeatCustomer(showtimeid, sdao.getSeatsByRoomId(roomid));
            request.setAttribute("listSeat", listSeat);
            Movie movie = moviedao.getMovieByID(movieid);
            request.setAttribute("movie", movie);
            Showtiming showtime = showdao.getShowtimingByShowtimeID(showtimeid);
            request.setAttribute("showtime", showtime);
        } catch (NumberFormatException e) {
            e.getMessage();
        }
        
        String requestURI = request.getRequestURI(); // /CineBooking/ConcessionBooking

        // Lấy chuỗi truy vấn (query string)
        String queryString = request.getQueryString(); // showtime=13&seats=V10,V15&price=180000

        // Xây dựng phần URL cần lấy
        StringBuilder Url = new StringBuilder();
        Url.append(requestURI);
        
        if (queryString != null) {
            Url.append("?").append(queryString);
        }
        /// add url back of seat
        HttpSession session = request.getSession();
        session.setAttribute("urlbackSeat", Url);
        System.out.println(Url);
        request.getRequestDispatcher("/views/seat_selection/Seat.jsp").forward(request, response);
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
