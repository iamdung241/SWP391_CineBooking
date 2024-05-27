/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Movie;
import model.TypeMovie;

/**
 *
 * @author tranh
 */
@MultipartConfig
public class movieController extends HttpServlet {

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
            out.println("<title>Servlet movieController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet movieController at " + request.getContextPath() + "</h1>");
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
    private static final String MANAGEMOVIE = "views/admin/managefilm.jsp";
    private static final String MANAGEMOVIE_ADD = "views/admin/addNewFilm.jsp";
    private static final String MANAGEMOVIE_UPDATE = "views/admin/updateFilm.jsp";
    private static final String MANAGEMOVIE_DETAIL = "views/admin/MovieDetail.jsp";
    private static final String MANAGEMOVIE_PAGE = "movie";
    private static final String MODE = "mode";
    private static final String MOVIEID = "idMovie";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter(MODE) != null && request.getParameter(MODE).equals("add")) {
            List<TypeMovie> typeMovie = new MovieDAO().getTypeMovie();
            request.setAttribute("typeMovie", typeMovie);
            request.getRequestDispatcher(MANAGEMOVIE_ADD).forward(request, response);
        }
        if (request.getParameter(MODE) != null && request.getParameter(MODE).equals("update")) {
            List<TypeMovie> typeMovie = new MovieDAO().getTypeMovie();
            request.setAttribute("typeMovie", typeMovie);
            Movie movie = new MovieDAO().getMovieByID(Integer.parseInt(request.getParameter(MOVIEID)));
            request.setAttribute("movieUpdate", movie);
            request.getRequestDispatcher(MANAGEMOVIE_UPDATE).forward(request, response);
        }
        if (request.getParameter(MODE) != null && request.getParameter(MODE).equals("detail")) {
            Movie movie = new MovieDAO().getMovieByID(Integer.parseInt(request.getParameter(MOVIEID)));
            request.setAttribute("movieDetail", movie);
            request.getRequestDispatcher(MANAGEMOVIE_DETAIL).forward(request, response);
        }
        if (request.getParameter(MODE) != null && request.getParameter(MODE).equals("del")) {
            String idMovie = request.getParameter(MOVIEID);
            MovieDAO md = new MovieDAO();
            md.DeleteMovie(Integer.parseInt(idMovie));
        }
        List<Movie> list = new MovieDAO().getMovie();
        request.setAttribute("listMovie", list);
        request.getRequestDispatcher(MANAGEMOVIE).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST  </code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ID = "id";
    private static final String NAME = "name";
    private static final String TYPE = "type";
    private static final String DURATION = "duration";
    private static final String DATE = "date";
    private static final String TRAILER = "trailer";
    private static final String DESCRIPTION = "description";
    private static final String IMG = "img";
    private static final String UPLOAD_DIR = "E:\\SWP391\\CineBooking\\web\\img\\FilmPoster";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter(NAME);
        String type = request.getParameter(TYPE);
        String duration = request.getParameter(DURATION);
        String date = request.getParameter(DATE);
        String trailer = request.getParameter(TRAILER);
        String description = request.getParameter(DESCRIPTION);
        String img = "img/FilmPoster/";
        MovieDAO md = new MovieDAO();
        File fileSaveDir = new File(UPLOAD_DIR);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        // Lấy file upload từ request
        Part part = request.getPart("file");
        if (part != null && part.getSize() > 0) {
            String fileName = extractFileName(part);
            // Đảm bảo fileName không null
            if (fileName != null && !fileName.isEmpty()) {
                part.write(UPLOAD_DIR + File.separator + fileName);
            }
            img += fileName;
        }
        Movie movie = new Movie(0, name, Integer.parseInt(type), "", Integer.parseInt(duration), date, img, trailer, description);
        if(request.getParameter(MODE)!=null&&request.getParameter(MODE).equals("add")){
            md.addNewMovie(movie);
        }
        if(request.getParameter(MODE)!=null&&request.getParameter(MODE).equals("update")){
            String id = request.getParameter(ID);
            String imgs = request.getParameter(IMG);
            if( part != null && part.getSize() <=0){
                Movie movies = new Movie(0, name, Integer.parseInt(type), "", Integer.parseInt(duration), date, imgs, trailer, description);
                movies.setMovie_id(Integer.parseInt(id));
                md.updateMovie(movies);
            }else{
                movie.setMovie_id(Integer.parseInt(id));
                md.updateMovie(movie);
            }
        }
        response.sendRedirect(MANAGEMOVIE_PAGE);
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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
