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
import java.util.ArrayList;
import java.util.List;
import model.Concession;
import model.PageControl;

/**
 *
 * @author Son
 */
public class FilterServlet extends HttpServlet {

    ConcessionDAO dao = new ConcessionDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Chuyển tiếp POST request đến doGet
    }

    /**
 * Handles the HTTP GET request for managing concessions.
 * This method processes pagination, filtering, and keyword search functionalities.
 * 
 * @param request  the HttpServletRequest object that contains the request the client has made of the servlet
 * @param response the HttpServletResponse object that contains the response the servlet sends to the client
 * @throws ServletException if the request could not be handled
 * @throws IOException      if an input or output error is detected when the servlet handles the request
 */
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filter = request.getParameter("filter");
        String keyword = request.getParameter("keyword");
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page < 1) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        List<Concession> listConcession = new ArrayList<>();
        int totalRecords = 0;

        if (keyword != null && !keyword.isEmpty()) {
            if (filter != null && !filter.isEmpty()) {
                switch (filter) {
                    case "priceAsc":
                        listConcession = dao.findByKeywordOrderedByPricee(keyword, true, page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getTotalRecordsByKeyword(keyword);
                        break;
                    case "priceDesc":
                        listConcession = dao.findByKeywordOrderedByPricee(keyword, false, page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getTotalRecordsByKeyword(keyword);
                        break;
                    case "quantityAsc":
                        listConcession = dao.findByKeywordOrderedByQuantityy(keyword, true, page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getTotalRecordsByKeyword(keyword);
                        break;
                    case "quantityDesc":
                        listConcession = dao.findByKeywordOrderedByQuantityy(keyword, false, page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getTotalRecordsByKeyword(keyword);
                        break;
                    default:
                        listConcession = dao.findByKeyword(keyword, page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getTotalRecordsByKeyword(keyword);
                        break;
                }
                }else{
                    listConcession = dao.findByKeyword(keyword, page, CommonConst.RECORD_PER_PAGE);
                    totalRecords = dao.getTotalRecordsByKeyword(keyword);
                }
            } else if (filter != null && !filter.isEmpty()) {
                switch (filter) {
                    case "priceAsc":
                        listConcession = dao.getConcessionsOrderedByPricee(true, page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getTotalRecordsByPricee(true);
                        break;
                    case "priceDesc":
                        listConcession = dao.getConcessionsOrderedByPricee(false, page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getTotalRecordsByPricee(false);
                        break;
                    case "quantityAsc":
                        listConcession = dao.getConcessionsOrderedByQuantityy(true, page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getTotalRecordsByQuantityy(true);
                        break;
                    case "quantityDesc":
                        listConcession = dao.getConcessionsOrderedByQuantityy(false, page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getTotalRecordsByQuantityy(false);
                        break;
                    default:
                        listConcession = dao.getAllConcession(page, CommonConst.RECORD_PER_PAGE);
                        totalRecords = dao.getAllConcession(1, Integer.MAX_VALUE).size();
                        break;
                }
            } else {
                listConcession = dao.getAllConcession(page, CommonConst.RECORD_PER_PAGE);
                totalRecords = dao.getAllConcession(1, Integer.MAX_VALUE).size();
            }

            PageControl pageControl = new PageControl();
            pageControl.setPage(page);
            pageControl.setTotalRecord(totalRecords);
            pageControl.setTotalPage((int) Math.ceil((double) totalRecords / CommonConst.RECORD_PER_PAGE));

            String requestURL = request.getRequestURI().toString();
            String ulrPattern = requestURL + "?";
            if (filter != null && !filter.isEmpty()) {
                ulrPattern += "filter=" + filter + "&";
            }
            if (keyword != null && !keyword.isEmpty()) {
                ulrPattern += "keyword=" + keyword + "&";
            }
            pageControl.setUlrPattern(ulrPattern);

            request.setAttribute("listConcession", listConcession);
            request.setAttribute("pageControl", pageControl);
            request.setAttribute("selectedFilter", filter);
            request.setAttribute("keyword", keyword);

            request.getRequestDispatcher("../views/admin/manageconcession.jsp").forward(request, response);
        }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
