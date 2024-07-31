/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.MovieDAO;
import dal.TheaterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Movie;
import model.Showtiming;
import model.Theater;

/**
 *
 * @author Admin
 */
public class TicketSellerController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet TicketSellerController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketSellerController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String service = "search";
        String selectedDate = request.getParameter("date");

        List<Movie> filteredMovies = new ArrayList<>();
        if (service.equals("search")) {
            int theaterId = Integer.parseInt(request.getParameter("theaterID"));
            HttpSession session = request.getSession();
            session.setAttribute("theaterID", theaterId);
            filteredMovies = (new MovieDAO()).getMovieByTheater(theaterId);
            if (selectedDate == null || selectedDate.isEmpty()) {
                // Set selectedDate to today's date
                LocalDate today = LocalDate.now();
                selectedDate = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            }
            if (selectedDate != null) {
                filteredMovies = new MovieDAO().getMovieByTheater_Date(theaterId, selectedDate);
            }
            for (Movie movie : filteredMovies) {
                List<Showtiming> filteredShowtimes = new ArrayList<>();
                for (Showtiming showtime : movie.getListShowtime()) {
                    if (showtime.getDate().equals(selectedDate)) {
                        try {
                            String showtimeDateTimeStr = showtime.getDate() + " " + showtime.getShowtiming() + ":00";
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                            Date showtimeDateTime = sdf.parse(showtimeDateTimeStr);
                            Date oneHourBeforeNow = new Date(System.currentTimeMillis() - 3600000);
                            if (showtimeDateTime.compareTo(oneHourBeforeNow) > 0) {

                                filteredShowtimes.add(showtime);
                            }
                        } catch (ParseException ex) {
                            ex.getMessage();
                        }
                    }
                }
                if (!filteredShowtimes.isEmpty()) {
                    movie.setListShowtime(filteredShowtimes);
                    filteredMovies.add(movie);
                }
            }
            Theater theater = (new TheaterDAO()).getTheaterByTheaterID(theaterId);

            request.setAttribute("theater", theater);
            request.setAttribute("listMovieTheater", filteredMovies);
            request.setAttribute("selectedDate", selectedDate);
        }
        request.getRequestDispatcher("/ticketSeller/TicketSeller.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
