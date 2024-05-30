/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.DBContext;
import dal.MovieDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Movie;

/**
 *
 * @author Admin
 */
public class MovieControllerForUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");
        String keyword = req.getParameter("keyword");
        String dateFilter = req.getParameter("dateFilter");

        if (service != null && service.equals("search")) {
            if (keyword != null && !keyword.isEmpty()) {
                // Handle search by keyword
                List<Movie> listM = (new MovieDAO()).getMoviesByKeywords(keyword);
                if (listM.isEmpty()) {
                    req.setAttribute("resultNull", "No films found matching your search criteria.");
                    req.getRequestDispatcher("/views/homepage/Home.jsp").forward(req, resp);
                } else {
                    req.setAttribute("listM", listM);
                    req.getRequestDispatcher("/views/homepage/Home.jsp").forward(req, resp);
                }
            } else {
                List<Movie> listM = (new MovieDAO()).getAllMovies();
                req.setAttribute("listM", listM);
                req.getRequestDispatcher("/views/homepage/Home.jsp").forward(req, resp);

            }
        } else if (service != null && service.equals("filter")) {
            if (dateFilter != null) {
                // Handle date filtering
                if (dateFilter.equals("upcoming")) {
                    List<Movie> listM = (new MovieDAO()).getMoviesPublishedAfterToday();
                    req.setAttribute("listM", listM);
                    req.getRequestDispatcher("/views/homepage/Home.jsp").forward(req, resp);
                } else if (dateFilter.equals("nowshowing")) {
                    List<Movie> listM = (new MovieDAO()).getMoviesPublishedBeforeToday();
                    req.setAttribute("listM", listM);
                    req.getRequestDispatcher("/views/homepage/Home.jsp").forward(req, resp);
                } else if (dateFilter.equals("all")) {
                    List<Movie> listM = (new MovieDAO()).getAllMovies();
                    req.setAttribute("listM", listM);
                    req.getRequestDispatcher("/views/homepage/Home.jsp").forward(req, resp);
                }
            }
        }
    }

}
