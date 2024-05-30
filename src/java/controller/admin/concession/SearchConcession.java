/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.concession;

import dal.ConcessionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Concession;

/**
 *
 * @author Son
 */
public class SearchConcession extends HttpServlet {

    ConcessionDAO dao = new ConcessionDAO();

    /**
     * Handles GET requests to retrieve concession items from the database based
     * on a keyword, sets them as a session attribute, and forwards the request
     * to the manageconcession.jsp view.
     *
     * @param request the HTTP request object
     * @param response the HTTP response object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String keyword = request.getParameter("keyword");
        List<Concession> listConcession = dao.findByKeyword(keyword);

        session.setAttribute("listConcession", listConcession);
        request.getRequestDispatcher("../views/admin/manageconcession.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
