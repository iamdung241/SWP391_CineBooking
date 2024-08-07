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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoomDAO roomDao = new RoomDAO();
        MovieDAO movieDao = new MovieDAO();
        List<Room> listRoom = roomDao.getAllRooms();
        request.setAttribute("listRoom", listRoom);
        String movieId = request.getParameter("idMovie");
        try {
            Movie movie = movieDao.getMovieById(Integer.parseInt(movieId));
            request.setAttribute("movie", movie);
        } catch(NumberFormatException e) {
            e.getMessage();
        }
        request.getRequestDispatcher("/views/dashboard/addshowtime.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieDAO movieDao = new MovieDAO();
        ShowtimingDAO showDao = new ShowtimingDAO();
        String showtime = request.getParameter("showtime");
        String movieName = request.getParameter("movie");
        String roomId = request.getParameter("room");
        String date = request.getParameter("date");
        int theaterID = Integer.parseInt(request.getParameter("theaterID"));
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
                Showtiming showtiming = new Showtiming(showtime, Integer.parseInt(roomId), date, movieId, theaterID);
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
}
