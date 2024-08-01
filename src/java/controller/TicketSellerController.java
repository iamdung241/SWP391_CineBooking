/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.MovieDAO;
import dal.RoomDAO;
import dal.ShowtimingDAO;
import dal.TheaterDAO;
import dal.TypeMovieDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Movie;
import model.Room;
import model.Showtiming;
import model.Theater;
import model.TypeMovie;

/**
 *
 * @author Admin
 */
public class TicketSellerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String service = request.getParameter("service");
        String selectedDate = request.getParameter("date");
        String theaterID = request.getParameter("theaterID");
        String movieID = request.getParameter("movieID");

        List<Movie> filteredMovies = new ArrayList<>();
        if (service.equals("search")) {
            int theaterId = Integer.parseInt(theaterID);
            HttpSession session = request.getSession();
            session.setAttribute("theaterID", theaterId);
            
            if (selectedDate == null || selectedDate.isEmpty()) {
                // Set selectedDate to today's date
                LocalDate today = LocalDate.now();
                selectedDate = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            }
            System.out.println(selectedDate);
            filteredMovies = (new MovieDAO()).getMovieByTheaterY(theaterId, selectedDate);

            if (selectedDate != null) {
                if (movieID != null) {
                    filteredMovies = new MovieDAO().getMovieByTheaterY(theaterId, selectedDate);
                }
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
                   // filteredMovies.add(movie);
                }
            }
            Theater theater = (new TheaterDAO()).getTheaterByTheaterID(theaterId);

            request.setAttribute("theater", theater);
            request.setAttribute("listMovieTheater", filteredMovies);
            request.setAttribute("selectedDate", selectedDate);
        }
        request.getRequestDispatcher("/ticketSeller/TicketSeller.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
