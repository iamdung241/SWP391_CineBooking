/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.dashboard;

import com.google.gson.Gson;
import dal.RevenueDAO;
import java.io.IOException;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Son
 */
public class RevenueFilmServlet extends HttpServlet {

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

        double totalRevenue = revenueDAO.getTotalFilmRevenue(startDateParam, endDateParam);
        double averageValue = revenueDAO.getAverageValueOfMovieBook(startDateParam, endDateParam);
        List<String[]> topMovies = revenueDAO.getTop3Movies(startDateParam, endDateParam);
        List<String[]> filmRevenueByDay = revenueDAO.getFilmRevenueByDay(startDateParam, endDateParam);
        
        Gson gson = new Gson();
        String filmRevenueByDayJson = gson.toJson(filmRevenueByDay);

        // Format the total revenue and average value
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(localeVN);
        String formattedTotalRevenue = currencyFormatter.format(totalRevenue).replace("₫", "VNĐ");
        String formattedAverageValue = currencyFormatter.format(averageValue).replace("₫", "VNĐ");

        request.setAttribute("totalRevenue", formattedTotalRevenue);
        request.setAttribute("averageValue", formattedAverageValue);
        request.setAttribute("topMovies", topMovies);
        request.setAttribute("filmRevenueByDay", filmRevenueByDayJson);
        request.setAttribute("startDate", startDateParam);
        request.setAttribute("endDate", endDateParam);

        request.setAttribute("defaultStartDate", startDate.format(formatter));
        request.setAttribute("defaultEndDate", endDate.format(formatter));

        request.getRequestDispatcher("/views/dashboard/revenue/filmrevenue.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
