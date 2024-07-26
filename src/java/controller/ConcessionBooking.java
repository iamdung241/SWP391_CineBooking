/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ConcessionDAO;
import dal.MovieDAO;
import dal.RoomDAO;
import dal.ShowtimingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Concession;
import model.Movie;
import model.Room;
import model.Showtiming;

/**
 *
 * @author tranh
 */
public class ConcessionBooking extends HttpServlet {
   
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
            out.println("<title>Servlet ConcessionBooking</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConcessionBooking at " + request.getContextPath () + "</h1>");
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
    private static final String SHOWTIME = "showtime";
    private static final String PRICE = "price";
    private static final String SEAT = "seats";
    private static final String ORDER = "/views/seat_selection/SelectedConcession.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String showtime = request.getParameter(SHOWTIME);
        String seat = request.getParameter(SEAT);
        String price = request.getParameter(PRICE);
        System.out.println("gia : " + price);
        Showtiming show = new ShowtimingDAO().getShowtimingByShowtimeID(Integer.parseInt(showtime));
        Movie movie = new MovieDAO().getMovieByID(show.getMovie_id());
        Room room = new RoomDAO().getRoomByID(show.getRoom_id());
        List<Concession> conc = new ConcessionDAO().getAllConcessions();
        request.setAttribute("concessions", conc);
        request.setAttribute("movie", movie);
        request.setAttribute("room", room);
        request.setAttribute("seat", seat);
        request.setAttribute("show", show);
        request.setAttribute("totalprice", price.replace("₫", "").replace(".", "").trim());
        
        String requestURI = request.getRequestURI(); // /CineBooking/ConcessionBooking

        // Lấy chuỗi truy vấn (query string)
        String queryString = request.getQueryString(); // showtime=13&seats=V10,V15&price=180000

        // Xây dựng phần URL cần lấy
        StringBuilder partialUrl = new StringBuilder();
        partialUrl.append(requestURI);
        
        if (queryString != null) {
            partialUrl.append("?").append(queryString);
        }
        HttpSession session = request.getSession();
        session.setAttribute("urlback", partialUrl);
        request.getRequestDispatcher(ORDER).forward(request, response);        
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
