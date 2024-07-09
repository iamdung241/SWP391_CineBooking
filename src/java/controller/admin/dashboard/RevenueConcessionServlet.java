/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.dashboard;

import com.google.gson.Gson;
import dal.RevenueDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Son
 */
public class RevenueConcessionServlet extends HttpServlet {
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
        LocalDate startDate = endDate.minusDays(14);

        if (startDateParam == null || endDateParam == null) {
            startDateParam = startDate.format(formatter);
            endDateParam = endDate.format(formatter);
        }

        RevenueDAO revenueDAO = new RevenueDAO();

        double totalRevenue = revenueDAO.getTotalConcessionRevenue(startDateParam, endDateParam);
        double averageValue = revenueDAO.getAverageValueOfConcessionBook(startDateParam, endDateParam);
        List<String[]> topConcessions = revenueDAO.getTop4Concessions(startDateParam, endDateParam);
        List<String[]> concessionRevenueByDay = revenueDAO.getConcessionRevenueByDay(startDateParam, endDateParam);
        
        System.out.println("Total Revenue: " + totalRevenue);
        System.out.println("Average Value: " + averageValue);
        System.out.println("Top Concessions:");
        for (String[] concession : topConcessions) {
            System.out.println("Concession: " + concession[0] + ", Quantity: " + concession[1]);
        }
        System.out.println("Concession Revenue By Day:");
        for (String[] revenue : concessionRevenueByDay) {
            System.out.println("Date: " + revenue[0] + ", Revenue: " + revenue[1]);
        }
        
        Gson gson = new Gson();
        String concessionRevenueByDayJson = gson.toJson(concessionRevenueByDay);

        // Format the total revenue and average value
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(localeVN);
        String formattedTotalRevenue = currencyFormatter.format(totalRevenue).replace("₫", "VNĐ");
        String formattedAverageValue = currencyFormatter.format(averageValue).replace("₫", "VNĐ");

        System.out.println("Total Revenue: " + formattedTotalRevenue);
        System.out.println("Average Value: " + formattedAverageValue);

        request.setAttribute("totalRevenue", formattedTotalRevenue);
        request.setAttribute("averageValue", formattedAverageValue);
        request.setAttribute("topConcessions", topConcessions);
        request.setAttribute("concessionRevenueByDay", concessionRevenueByDayJson);
        request.setAttribute("startDate", startDateParam);
        request.setAttribute("endDate", endDateParam);

        request.setAttribute("defaultStartDate", startDate.format(formatter));
        request.setAttribute("defaultEndDate", endDate.format(formatter));

        request.getRequestDispatcher("/views/dashboard/revenue/concessionrevenue.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
