/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;
import constant.CommonConst;
import dal.ConcessionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Concession;
import model.PageControl;

/**
 *
 * @author thanh
 */
// url: /concession
public class ConcessionServlet extends HttpServlet {

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
            out.println("<title>Servlet ConcessionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConcessionServlet at " + request.getContextPath() + "</h1>");
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
    
    //author: Thanh
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ConcessionDAO dao = new ConcessionDAO();
    String search = request.getParameter("search");
    String filter = request.getParameter("filter");
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

    List<Concession> listC = new ArrayList<>();
    int totalRecords = 0;

    if (search != null && !search.isEmpty()) {
        switch (filter) {
            case "f_d":
                listC = dao.findByKeywordAndType(search, "Food & Drink", page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getTotalRecordsByKeywordAndType(search, "Food & Drink");
                break;
            case "combo":
                listC = dao.findByKeywordAndType(search, "Combo", page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getTotalRecordsByKeywordAndType(search, "Combo");
                break;
            case "price_increase":
                listC = dao.findByKeywordOrderedByPrice(search, true, page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getTotalRecordsByKeyword(search);
                break;
            case "price_decrease":
                listC = dao.findByKeywordOrderedByPrice(search, false, page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getTotalRecordsByKeyword(search);
                break;
            default:
                listC = dao.findByName(search, page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getTotalRecordsByName(search);
                break;
        }
    } else if (filter != null && !filter.isEmpty()) {
        switch (filter) {
            case "f_d":
                listC = dao.getConcessionsByType("Food & Drink", page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getTotalRecordsByType("Food & Drink");
                break;
            case "combo":
                listC = dao.getConcessionsByType("Combo", page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getTotalRecordsByType("Combo");
                break;
            case "price_increase":
                listC = dao.getConcessionsOrderedByPrice(true, page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getTotalRecordsByPrice(true);
                break;
            case "price_decrease":
                listC = dao.getConcessionsOrderedByPrice(false, page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getTotalRecordsByPrice(false);
                break;
            default:
                listC = dao.getAllConcessions(page, CommonConst.RECORD_PER_HOMEPAGE);
                totalRecords = dao.getAllConcessions(1, Integer.MAX_VALUE).size();
                break;
        }
    } else {
        listC = dao.getAllConcessions(page, CommonConst.RECORD_PER_HOMEPAGE);
        totalRecords = dao.getAllConcessions(1, Integer.MAX_VALUE).size();
    }

    PageControl pageControl = new PageControl();
    pageControl.setPage(page);
    pageControl.setTotalRecord(totalRecords);
    pageControl.setTotalPage((int) Math.ceil((double) totalRecords / CommonConst.RECORD_PER_HOMEPAGE));

    String requestURL = request.getRequestURI().toString();
    String ulrPattern = requestURL + "?";
    if (filter != null && !filter.isEmpty()) {
        ulrPattern += "filter=" + filter + "&";
    }
    if (search != null && !search.isEmpty()) {
        ulrPattern += "search=" + search + "&";
    }
    pageControl.setUlrPattern(ulrPattern);

    request.setAttribute("listC", listC);
    request.setAttribute("pageControl", pageControl);
    request.setAttribute("selectedFilter", filter);
    request.setAttribute("search", search);

    request.getRequestDispatcher("/views/homepage/Concession.jsp").forward(request, response);
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
