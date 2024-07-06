/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Movie;
import model.TypeMovie;

/**
 *
 * @author tranh
 */
public class AdminSearch_Filter extends HttpServlet {

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
            out.println("<title>Servlet AdminSearch_Filter</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminSearch_Filter at " + request.getContextPath() + "</h1>");
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
    private static final String KEY_SEARCH = "searchAdmin";
    private static final String TYPE_SEARCH = "typeId";
    private static final String ACT = "ACT";
    private static final String MANAGEMOVIE_ADMIN = "views/dashboard/managefilm.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter(ACT) != null && request.getParameter(ACT).equals("filter")) {
            int type = Integer.parseInt(request.getParameter(TYPE_SEARCH));
            request.setAttribute("typeSearch", type);
            if (type == 10) {
                List<Movie> searchTypeList = new MovieDAO().getMovie();
                request.setAttribute("listMovie", searchTypeList);
            } else {
                List<Movie> searchTypeList = new MovieDAO().getMovieByType(type);
                request.setAttribute("listMovie", searchTypeList);
            }
        }
        if (request.getParameter(KEY_SEARCH) != null) {
            String search = request.getParameter(KEY_SEARCH);
            request.setAttribute("key", search);
            List<Movie> searchList = new MovieDAO().getMoviesBySearch(search);
            request.setAttribute("listMovie", searchList);
        }
        List<TypeMovie> typelist = new MovieDAO().getTypeMovie();
        request.setAttribute("listType", typelist);
        request.getRequestDispatcher(MANAGEMOVIE_ADMIN).forward(request, response);

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
        processRequest(request, response);
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
