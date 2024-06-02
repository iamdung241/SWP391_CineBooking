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

        List<Concession> listConcession = dao.findByKeywordWithPagination(keyword, page);
        int totalRecord = dao.getTotalRecordsByKeyword(keyword);
        int totalPage = (totalRecord % CommonConst.RECORD_PER_PAGE) == 0
                ? (totalRecord / CommonConst.RECORD_PER_PAGE)
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;

        PageControl pageControl = new PageControl();
        String requestURL = request.getRequestURI().toString();
        pageControl.setUlrPattern(requestURL + "?keyword=" + keyword + "&");
        pageControl.setPage(page);
        pageControl.setTotalRecord(totalRecord);
        pageControl.setTotalPage(totalPage);

        session.setAttribute("listConcession", listConcession);
        request.setAttribute("pageControl", pageControl);
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
