/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.theater;

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
public class TheaterX extends HttpServlet {

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

        List<Movie> filteredMovies = new ArrayList<>();
        if (service.equals("searchAll")) {
            if (selectedDate == null) {
                filteredMovies = new MovieDAO().getMovieByTheaterX();

            } else {
                filteredMovies = new MovieDAO().getMovieByTheater_DateX(selectedDate);

//                if (filteredMovies != null) {
//                    for (Movie filteredMovy : filteredMovies) {
//                        List<Theater> theaterX = new ArrayList<>();
//                        if (filteredMovy != null) {
//                            for (Theater theater : filteredMovy.getListTheater()) {
//                                theaterX.add(theater);
//                            }
//                        }
//                        if (!theaterX.isEmpty()) {
//                            filteredMovy.setListTheater(theaterX);
//                            filteredMovies.add(filteredMovy);
//                        }
//                    }
//
//                    request.setAttribute("listAllMovie", filteredMovies);
//                }
//                
//            }
//            filteredMovies = (new MovieDAO()).getAllMovies();
//            if (selectedDate != null) {
//                filteredMovies = new MovieDAO().getMovieByTheater_DateX(selectedDate);
//            }
//            for (Movie movie : filteredMovies) {
//                List<Showtiming> filteredShowtimes = new ArrayList<>();
//                for (Showtiming showtime : movie.getListShowtime()) {
//                    if (showtime.getDate().equals(selectedDate)) {
//                        try {
//                            String showtimeDateTimeStr = showtime.getDate() + " " + showtime.getShowtiming() + ":00";
//                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//                            Date showtimeDateTime = sdf.parse(showtimeDateTimeStr);
//                            Date oneHourBeforeNow = new Date(System.currentTimeMillis() - 3600000);
//                            if (showtimeDateTime.compareTo(oneHourBeforeNow) > 0) {
//
//                                filteredShowtimes.add(showtime);
//                            }
//                        } catch (ParseException ex) {
//                            ex.getMessage();
//                        }
//                    }
//                }
//                if (!filteredShowtimes.isEmpty()) {
//                    movie.setListShowtime(filteredShowtimes);
//                    filteredMovies.add(movie);
//                }
//            }
//            //Theater theater = (new TheaterDAO()).getTheaterByTheaterID(theaterId);
//
//            //request.setAttribute("theater", theater);
//            request.setAttribute("listMovieTheater", filteredMovies);
//            request.setAttribute("selectedDate", selectedDate);
            }
            request.setAttribute("selectedDate", selectedDate);
            request.setAttribute("listAllMovie", filteredMovies);
            request.getRequestDispatcher("/views/homepage/Theaterx.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
