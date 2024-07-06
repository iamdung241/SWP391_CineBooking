/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RoomDAO;
import dal.ShowtimingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Room;
import model.Showtiming;

/**
 *
 * @author thanh
 */
@WebServlet(name = "UpdateShowtimeServlet", urlPatterns = {"/updateShowtime"})
public class UpdateShowtimeServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateShowtimeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateShowtimeServlet at " + request.getContextPath() + "</h1>");
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
        RoomDAO roomDao = new RoomDAO();
        List<Room> listRoom = roomDao.getAllRooms();
        request.setAttribute("listRoom", listRoom);
        ShowtimingDAO showDao = new ShowtimingDAO();
        String showtimeID = request.getParameter("showtimeID");
        try {
            int showtime_id = Integer.parseInt(showtimeID);
            Showtiming showtime = showDao.getShowtimingByShowtimeID(showtime_id);
            request.setAttribute("showtimeUpdate", showtime);
        } catch (NumberFormatException e) {
            e.getMessage();
        }
        request.getRequestDispatcher("/views/dashboard/editshowtime.jsp").forward(request, response);
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
        String roomID = request.getParameter("room");
        String showtime = request.getParameter("showtime");
        String date = request.getParameter("date");
        Showtiming showtiming = new Showtiming();
        ShowtimingDAO showDao = new ShowtimingDAO();
        try {
            int roomId = Integer.parseInt(roomID);
            showtiming.setRoom_id(roomId);
            showtiming.setShowtiming(showtime);
            showtiming.setDate(date);
            showDao.updateShowtime(showtiming);
            request.setAttribute("successMessage", "Edit showtime successfully");
            List<Showtiming> listShowtime = showDao.getListShowtiming();
            request.setAttribute("listShowtime", listShowtime);
            request.getRequestDispatcher("/views/dashboard/manageshowtime.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Update showtime fail");
            request.getRequestDispatcher("/views/dashboard/editshowtime.jsp").forward(request, response);
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