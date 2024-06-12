/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.concession;

import constant.CommonConst;
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
import model.PageControl;

/**
 *
 * @author Son
 */
public class ManageConcessionServlet extends HttpServlet {

    ConcessionDAO dao = new ConcessionDAO();

    /**
     * Handles GET requests to retrieve all concession items from the database,
     * sets them as a session attribute, and forwards the request to the
     * manageconcession.jsp view.
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
        PageControl pageControl = new PageControl();
        List<Concession> listConcession = listAllConcessionDoGet(request, pageControl);

        session.setAttribute("listConcession", listConcession);
        request.setAttribute("pageControl", pageControl);
        request.getRequestDispatcher("../views/admin/manageconcession.jsp").forward(request, response);
    }

    /**
     * Handles POST requests by forwarding them to the manageconcession.jsp
     * view.
     *
     * @param request the HTTP request object
     * @param response the HTTP response object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("../views/admin/manageconcession.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    /**
     * Retrieves a list of all concessions for the specified page and sets
     * pagination details.
     *
     * @param request the HttpServletRequest object that contains the request
     * the client has made of the servlet
     * @param pageControl the PageControl object to manage pagination details
     * @return a list of Concession objects for the specified page
     */
    private List<Concession> listAllConcessionDoGet(HttpServletRequest request, PageControl pageControl) {
        // get ve page, validate
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page < 0) {
                page = 1;
            }

        } catch (Exception e) {
            page = 1;
        }
        String requestULR = request.getRequestURI().toString();
        List<Concession> listConcession = dao.getAllConcession(page, CommonConst.RECORD_PER_PAGE);
        pageControl.setUlrPattern(requestULR + "?");
        // total record 
        int totalRecord = dao.getTotalRecordCount();
        // total page
//        int totalPage = (totalRecord % CommonConst.RECORD_PER_PAGE) == 0
//                ? (totalRecord / CommonConst.RECORD_PER_PAGE)
//                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;
        //set total record, total page, pageControl
        pageControl.setPage(page);
        pageControl.setTotalRecord(totalRecord);
//        pageControl.setTotalPage(totalPage);
        pageControl.setTotalPage((int) Math.ceil((double) totalRecord / CommonConst.RECORD_PER_PAGE));
        return listConcession;
    }

}
