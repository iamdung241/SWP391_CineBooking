/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class DashboardDAO extends DBContext {

    public double getTotalRevenue(String startDate, String endDate) {
        double totalRevenue = 0;
        String query = "SELECT SUM(totalprice) AS totalRevenue FROM Ticket_Detail WHERE date_book BETWEEN ? AND ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalRevenue = rs.getDouble("totalRevenue");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRevenue;
    }

    public int getTotalOrders(String startDate, String endDate) {
        int totalOrders = 0;
        String query = "SELECT COUNT(*) AS totalOrders FROM Ticket_Detail WHERE date_book BETWEEN ? AND ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalOrders = rs.getInt("totalOrders");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalOrders;
    }

    public double getAverageValueOrder(String startDate, String endDate) {
        double averageOrder = 0;
        String query = "SELECT AVG(totalprice) AS averageOrder FROM Ticket_Detail WHERE date_book BETWEEN ? AND ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    averageOrder = rs.getDouble("averageOrder");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return averageOrder;
    }

    public double getAverageOrdersPerDay(String startDate, String endDate) {
        double averageOrdersPerDay = 0;
        String query = "WITH DateRange AS ("
                + "    SELECT CAST(? AS DATE) AS Date "
                + "    UNION ALL "
                + "    SELECT DATEADD(DAY, 1, Date) "
                + "    FROM DateRange "
                + "    WHERE Date < CAST(? AS DATE)"
                + ") "
                + "SELECT AVG(daily_count) AS averageOrdersPerDay "
                + "FROM ("
                + "    SELECT DateRange.Date, ISNULL(COUNT(Ticket_Detail.date_book), 0) AS daily_count "
                + "    FROM DateRange "
                + "    LEFT JOIN Ticket_Detail ON DateRange.Date = CAST(Ticket_Detail.date_book AS DATE) "
                + "    GROUP BY DateRange.Date"
                + ") AS daily_counts "
                + "OPTION (MAXRECURSION 0)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    averageOrdersPerDay = rs.getDouble("averageOrdersPerDay");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return averageOrdersPerDay;
    }
    public Map<String, Double> getRevenueByTypeMovie(String startDate, String endDate) {
        Map<String, Double> revenueByTypeMovie = new HashMap<>();
        String query = "SELECT tm.type_name, SUM(td.totalprice) AS revenue "
                + "FROM Ticket_Detail td "
                + "JOIN Showtime st ON td.showtime_id = st.showtime_id "
                + "JOIN Movie m ON st.movie_id = m.movie_id "
                + "JOIN TypeMovie tm ON m.type_id = tm.type_id "
                + "WHERE td.date_book BETWEEN ? AND ? "
                + "GROUP BY tm.type_name";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String typeName = rs.getString("type_name");
                    double revenue = rs.getDouble("revenue");
                    revenueByTypeMovie.put(typeName, revenue);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return revenueByTypeMovie;
    }

    public Map<String, Integer> getOrderStatistics(String startDate, String endDate) {
        Map<String, Integer> orderStatistics = new TreeMap<>();
        String query = "SELECT CONVERT(VARCHAR(10), td.date_book, 120) AS date_book, COUNT(*) AS orders "
                + "FROM Ticket_Detail td "
                + "WHERE td.date_book BETWEEN ? AND ? "
                + "GROUP BY CONVERT(VARCHAR(10), td.date_book, 120) "
                + "ORDER BY CONVERT(VARCHAR(10), td.date_book, 120)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String dateBook = rs.getString("date_book");
                    int orders = rs.getInt("orders");
                    orderStatistics.put(dateBook, orders);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderStatistics;
    }

    public static void main(String[] args) {
        DashboardDAO dao = new DashboardDAO();
        String startDate = "2024-05-15";
        String endDate = "2024-06-06";

        // Test getRevenueByTypeMovie
        Map<String, Double> revenueByTypeMovie = dao.getRevenueByTypeMovie(startDate, endDate);
        System.out.println("Revenue By Type Movie:");
        for (Map.Entry<String, Double> entry : revenueByTypeMovie.entrySet()) {
            System.out.println("Type: " + entry.getKey() + ", Revenue: " + entry.getValue());
        }
        double averageOrdersPerDay = dao.getAverageOrdersPerDay(startDate, endDate);
        System.out.println("Average Orders Per Day: " + averageOrdersPerDay);
        // Test getOrderStatistics
        Map<String, Integer> orderStatistics = dao.getOrderStatistics(startDate, endDate);
        System.out.println("\nOrder Statistics:");
        for (Map.Entry<String, Integer> entry : orderStatistics.entrySet()) {
            System.out.println("Date: " + entry.getKey() + ", Orders: " + entry.getValue());
        }
    }
}
