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
import java.util.ArrayList;
import java.util.List;
import model.Concession;

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filter = request.getParameter("filter");

        List<Concession> listConcession = new ArrayList<>();
        if (filter != null && !filter.isEmpty()) {
            switch (filter) {
//                case "all":
//                    listConcession = dao.getAllConcessions();
//                    break;
                case ">=100000":
                    listConcession = dao.getConcessionsByPriceGreaterThan(100000);
                    break;
                case "<100000":
                    listConcession = dao.getConcessionsByPriceLessThan(100000);
                    break;
                case "<=30":
                    listConcession = dao.getConcessionsByQuantityLessThan(30);
                    break;
                default:
                    listConcession = dao.getAllConcessions();
                    break;
            }
        } else {
            listConcession = dao.getAllConcessions();
        }

        request.setAttribute("listConcession", listConcession);
        request.setAttribute("selectedFilter", filter);
        request.getRequestDispatcher("../views/admin/manageconcession.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
