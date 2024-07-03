/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public double getAverageOrder(String startDate, String endDate) {
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

    public static void main(String[] args) {
        DashboardDAO dao = new DashboardDAO();
        String startDate = "2024-06-01";
        String endDate = "2024-06-31";

        double totalRevenue = dao.getTotalRevenue(startDate, endDate);
        int totalOrders = dao.getTotalOrders(startDate, endDate);
        double averageOrder = dao.getAverageOrder(startDate, endDate);

        System.out.println("Total Revenue: $" + totalRevenue);
        System.out.println("Total Orders: " + totalOrders);
        System.out.println("Average Order: $" + averageOrder);
    }
}
