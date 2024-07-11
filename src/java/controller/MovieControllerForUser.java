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
import model.TypeMovie;
import dal.TypeMovieDAO;
import java.util.ArrayList;
import java.util.stream.Collectors;

/**
 *
 * @author DungTT
 */
public class MovieControllerForUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");
        String keyword = req.getParameter("keyword");
        String dateFilter = req.getParameter("dateFilter");
        List<TypeMovie> typeList = (new TypeMovieDAO()).getAllType();
        List<Movie> listM = new ArrayList<>();

        if (service != null) {
            switch (service) {
                case "search":
                    // Handle search by keyword
                    if (keyword != null && !keyword.isEmpty()) {
                        if (dateFilter != null && dateFilter.equals("nowshowing")) {
                            listM = (new MovieDAO()).getMoviesPublishedBeforeToday();
                            listM = searchMoviesByKeyword(listM, keyword);
                        } else {
                            listM = (new MovieDAO()).getMoviesByKeywords(keyword);
                        }
                        // Set resultNull attribute if no movies found
                        if (listM.isEmpty()) {
                            req.setAttribute("resultNull", "No films found matching your search criteria.");
                        }
                    } else {
                        listM = (new MovieDAO()).getMovie();
                    }
                    break;
                case "filter":
                    if (dateFilter != null) {
                        switch (dateFilter) {
                            case "upcoming":
                                listM = (new MovieDAO()).getMoviesPublishedAfterToday();
                                break;
                            case "nowshowing":
                                listM = (new MovieDAO()).getMoviesPublishedBeforeToday();
                                break;
                            case "all":
                                listM = (new MovieDAO()).getMovie();
                                break;
                        }
                    }
                    break;
                case "filter_type":
                    int typeId = Integer.parseInt(req.getParameter("type_id"));
                    listM = (new MovieDAO()).getMoviesByType(typeId);
                    break;
            }
        }
        // Set the attributes
        MovieDAO mdao = new MovieDAO();
        List<Movie> topMovie = mdao.getTopMovieForMonth();
        req.setAttribute("topMovie", topMovie);
        req.setAttribute("keyword", keyword);
        req.setAttribute("typeList", typeList);
        req.setAttribute("listM", listM.isEmpty() ? null : listM);
        req.getRequestDispatcher("/views/homepage/Home.jsp").forward(req, resp);
    }

    // Helper method to search movies by keyword within a given list
    private List<Movie> searchMoviesByKeyword(List<Movie> movies, String keyword) {
        return movies.stream()
                .filter(movie -> movie.getMovie_name().toLowerCase().contains(keyword.toLowerCase()))
                .collect(Collectors.toList());
    }
}