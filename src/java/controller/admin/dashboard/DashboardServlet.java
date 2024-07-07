/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.dashboard;

import dal.DashboardDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.Map;

/**
 *
 * @author Son
 */
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String startDateParam = request.getParameter("startDate");
        String endDateParam = request.getParameter("endDate");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate endDate = LocalDate.now();
        LocalDate startDate = endDate.minusDays(7);

        if (startDateParam == null || endDateParam == null) {
            startDateParam = startDate.format(formatter);
            endDateParam = endDate.format(formatter);
        }

        DashboardDAO dao = new DashboardDAO();

        double totalRevenue = dao.getTotalRevenue(startDateParam, endDateParam);
        int totalOrders = dao.getTotalOrders(startDateParam, endDateParam);
        double averageOrder = dao.getAverageOrder(startDateParam, endDateParam);
        Map<String, Double> revenueByTypeMovie = dao.getRevenueByTypeMovie(startDateParam, endDateParam);
        Map<String, Integer> orderStatistics = dao.getOrderStatistics(startDateParam, endDateParam);

        // Format the total revenue and average order
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(localeVN);
        String formattedTotalRevenue = currencyFormatter.format(totalRevenue).replace("₫", "VNĐ");
        String formattedAverageOrder = currencyFormatter.format(averageOrder).replace("₫", "VNĐ");
        
        System.out.println("Total Revenue: " + formattedTotalRevenue);
        System.out.println("Total Orders: " + totalOrders);
        System.out.println("Average Order: " + formattedAverageOrder);
        System.out.println("Revenue By Type Movie: " + revenueByTypeMovie);
        System.out.println("Order Statistics: " + orderStatistics);
        
        request.setAttribute("totalRevenue", formattedTotalRevenue);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("averageOrder", formattedAverageOrder);
        request.setAttribute("revenueByTypeMovie", revenueByTypeMovie);
        request.setAttribute("orderStatistics", orderStatistics);
        request.setAttribute("startDate", startDateParam);
        request.setAttribute("endDate", endDateParam);
        
        request.setAttribute("defaultStartDate", startDate.format(formatter));
        request.setAttribute("defaultEndDate", endDate.format(formatter));

        request.getRequestDispatcher("views/dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
