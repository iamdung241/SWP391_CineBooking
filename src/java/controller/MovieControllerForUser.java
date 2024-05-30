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
        if (service.equals("search")) {
            String keyword = req.getParameter("keyword");
            List<Movie> listM = (new MovieDAO()).getMoviesByKeywords(keyword);

            req.setAttribute("listM", listM);
            req.getRequestDispatcher("/views/homepage/Home.jsp").forward(req, resp);
        }
    }

}
