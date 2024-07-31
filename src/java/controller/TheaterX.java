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
        
        TheaterDAO tdao = new TheaterDAO();
        List<Theater> listTheater = tdao.getAllTheater();
        request.setAttribute("listTheater", listTheater);

        List<Movie> filteredMovies = new ArrayList<>();
        if (service.equals("searchAll")) {
            if (selectedDate == null) {
                filteredMovies = new MovieDAO().getMovieByTheaterX();

            }
            if (selectedDate == null || selectedDate.isEmpty()) {
                // Set selectedDate to today's date
                LocalDate today = LocalDate.now();
                selectedDate = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                filteredMovies = new MovieDAO().getMovieByTheater_DateX(selectedDate);
            }

        }
        request.setAttribute("selectedDate", selectedDate);
        request.setAttribute("listAllMovie", filteredMovies);
        request.getRequestDispatcher("/views/homepage/Theaterx.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
