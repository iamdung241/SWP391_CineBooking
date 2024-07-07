/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MovieDAO;
import dal.RoomDAO;
import dal.ShowtimingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Movie;
import model.Room;
import model.Showtiming;

/**
 *
 * @author thanh
 */
public class AddNewShowtimeServlet extends HttpServlet {

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
            out.println("<title>Servlet AddNewShowtimeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewShowtimeServlet at " + request.getContextPath() + "</h1>");
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
        RoomDAO roomDao = new RoomDAO();
        MovieDAO movieDao = new MovieDAO();
        List<Room> listRoom = roomDao.getAllRooms();
        request.setAttribute("listRoom", listRoom);
        List<Movie> listMovie = movieDao.getMoviesPublishedBeforeToday();
        request.setAttribute("listMovie", listMovie);
        request.getRequestDispatcher("/views/dashboard/addshowtime.jsp").forward(request, response);
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
        MovieDAO movieDao = new MovieDAO();
        ShowtimingDAO showDao = new ShowtimingDAO();
        String showtime = request.getParameter("showtime");
        String movieName = request.getParameter("movie");
        String roomId = request.getParameter("room");
        String date = request.getParameter("date");
        try {
            int movieId = movieDao.getMovieIdByMovieName(movieName);
            if (roomId == null || "all".equals(roomId)) {
                request.setAttribute("errorMessage", "Please choose a room.");
                request.getRequestDispatcher("/views/dashboard/addshowtime.jsp").forward(request, response);
                return;
            }
            boolean isShowtime = showDao.checkShowtimeExists(date, showtime, Integer.parseInt(roomId));
            if (isShowtime) {
                request.setAttribute("errorMessage", "Showtime already exists");
                request.getRequestDispatcher("/views/dashboard/addshowtime.jsp").forward(request, response);
            } else {
                Showtiming showtiming = new Showtiming(showtime, Integer.parseInt(roomId), date, movieId);
                showDao.addShowtime(showtiming);
                request.setAttribute("successMessage", "Add showtime successfully");
                List<Showtiming> listShowtime = showDao.getListShowtiming();
                request.setAttribute("listShowtime", listShowtime);
                request.getRequestDispatcher("/views/dashboard/manageshowtime.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Add showtime fail");
            request.getRequestDispatcher("/views/dashboard/addshowtime.jsp").forward(request, response);
        }

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
