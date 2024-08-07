/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MovieDAO;
import dal.RoomDAO;
import dal.ShowtimingDAO;
import dal.TheaterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Movie;
import model.Room;
import model.Showtiming;
import model.Theater;

/**
 *
 * @author thanh
 */
public class BookTicketServlet extends HttpServlet {

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
            out.println("<title>Servlet BookTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookTicketServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieDAO movieDao = new MovieDAO();
        ShowtimingDAO showDao = new ShowtimingDAO();
        RoomDAO rdao = new RoomDAO();
        String movieID = request.getParameter("movieID");
        String selectedDate = request.getParameter("date");
        String theaterId = request.getParameter("theaterID");
        

        if (selectedDate == null) {
            selectedDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }

        if (movieID!=null){
            List<Theater> theaterList = new TheaterDAO().getTheaterByAll(Integer.parseInt(movieID), selectedDate);
        request.setAttribute("theaterList", theaterList);
        }

        if (theaterId != null) {
            int theaterID = Integer.parseInt(theaterId);
            List<Showtiming> showList = new ShowtimingDAO().getRoomAndShowtime(Integer.parseInt(movieID),
                    selectedDate, theaterID);
            request.setAttribute("showList", showList);
            request.setAttribute("selectedTheaterID", theaterID);
        }
        

        List<Showtiming> filteredShowtimes = new ArrayList<>();
        try {
            int idMovie = Integer.parseInt(movieID);
            Movie m = movieDao.getMovieById(idMovie);
            if (m != null) {
                for (Showtiming showtime : showDao.getShowtimeByMovieID(idMovie)) {
                    if (showtime.getDate().equals(selectedDate)) {
                        String showtimeDateTimeStr = showtime.getDate() + " " + showtime.getShowtiming() + ":00";
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                        Date showtimeDateTime = sdf.parse(showtimeDateTimeStr);
                        Date oneHourBeforeNow = new Date(System.currentTimeMillis() - 3600000);
                        if (showtimeDateTime.compareTo(oneHourBeforeNow) > 0) {
                            filteredShowtimes.add(showtime);
                        }
                    }
                }
                if (!filteredShowtimes.isEmpty()) {
                    m.setListShowtime(filteredShowtimes);
                }
            }
            request.setAttribute("movie", m);
            request.setAttribute("listShowtime", filteredShowtimes);
            request.setAttribute("selectedDate", selectedDate);
            String showtimeid = request.getParameter("showtimeID");
            if (showtimeid != null) {
                int showtime_id = Integer.parseInt(showtimeid);
                List<Room> listRoom = rdao.getRoomsByShowtimeID(showtime_id);
                request.setAttribute("listRoom", listRoom);
                request.setAttribute("selectedShowtimeId", showtimeid);
            }

        } catch (NumberFormatException e) {
            e.getMessage();
        } catch (ParseException ex) {
            ex.getMessage();
        }
        String requestURI = request.getRequestURI(); // /CineBooking/ConcessionBooking

        // Lấy chuỗi truy vấn (query string)
        String queryString = request.getQueryString(); // showtime=13&seats=V10,V15&price=180000

        // Xây dựng phần URL cần lấy
        StringBuilder Url = new StringBuilder();
        Url.append(requestURI);

        if (queryString != null) {
            Url.append("?").append(queryString);
        }

        HttpSession session = request.getSession();
        session.setAttribute("urlbackBooking", Url);
        request.getRequestDispatcher("/views/homepage/BookTicket.jsp").forward(request, response);
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
        String roomId = request.getParameter("roomId");
        String showtimeId = request.getParameter("showtimeId");
        if (roomId != null && showtimeId != null) {
            response.sendRedirect("seat");
        }
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
