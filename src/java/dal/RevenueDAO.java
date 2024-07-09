/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Son
 */
public class RevenueDAO extends DBContext {

    public double getTotalFilmRevenue(String startDate, String endDate) {
        double totalRevenue = 0;
        String sql = "SELECT SUM(td.totalprice) as totalRevenue "
                + "FROM Ticket_Detail td "
                + "INNER JOIN Showtime st ON td.showtime_id = st.showtime_id "
                + "WHERE st.date >= ? AND st.date <= ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                totalRevenue = rs.getDouble("totalRevenue");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return totalRevenue;
    }

    public double getAverageValueOfMovieBook(String startDate, String endDate) {
        double averageValue = 0;
        String sql = "SELECT AVG(td.totalprice) as averageValue "
                + "FROM Ticket_Detail td "
                + "INNER JOIN Showtime st ON td.showtime_id = st.showtime_id "
                + "WHERE st.date >= ? AND st.date <= ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                averageValue = rs.getDouble("averageValue");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return averageValue;
    }

    public List<String[]> getTop3Movies(String startDate, String endDate) {
        List<String[]> topMovies = new ArrayList<>();
        String sql = "SELECT TOP 3 m.movie_name, COUNT(td.id) as quantity, m.post_img "
                + "FROM Ticket_Detail td "
                + "INNER JOIN Showtime st ON td.showtime_id = st.showtime_id "
                + "INNER JOIN Movie m ON st.movie_id = m.movie_id "
                + "WHERE st.date >= ? AND st.date <= ? "
                + "GROUP BY m.movie_name, m.post_img "
                + "ORDER BY quantity DESC";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String[] movie = new String[3];
                movie[0] = rs.getString("movie_name");
                movie[1] = String.valueOf(rs.getInt("quantity"));
                movie[2] = rs.getString("post_img");
                topMovies.add(movie);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return topMovies;
    }

    public List<String[]> getFilmRevenueByDay(String startDate, String endDate) {
        List<String[]> revenueByDay = new ArrayList<>();
        String sql = "SELECT st.date, SUM(td.totalprice) as totalRevenue "
                + "FROM Ticket_Detail td "
                + "INNER JOIN Showtime st ON td.showtime_id = st.showtime_id "
                + "WHERE st.date >= ? AND st.date <= ? "
                + "GROUP BY st.date "
                + "ORDER BY st.date";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String[] revenue = new String[2];
                revenue[0] = rs.getString("date");
                revenue[1] = String.valueOf(rs.getDouble("totalRevenue"));
                revenueByDay.add(revenue);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return revenueByDay;
    }

    public static void main(String[] args) {
        // Thời gian bắt đầu và kết thúc để lọc dữ liệu
        String startDate = "2024-05-05";
        String endDate = "2024-07-06";

        // Tạo đối tượng RevenueDAO
        RevenueDAO revenueDAO = new RevenueDAO();

        // Kiểm tra phương thức getTotalFilmRevenue
        double totalFilmRevenue = revenueDAO.getTotalFilmRevenue(startDate, endDate);
        System.out.println("Total Film Revenue from " + startDate + " to " + endDate + ": " + totalFilmRevenue);

        // Kiểm tra phương thức getAverageValueOfMovieBook
        double averageFilmValue = revenueDAO.getAverageValueOfMovieBook(startDate, endDate);
        System.out.println("Average Value of Movie Book from " + startDate + " to " + endDate + ": " + averageFilmValue);

        // Kiểm tra phương thức getTop4Movies
        List<String[]> topMovies = revenueDAO.getTop3Movies(startDate, endDate);
        System.out.println("Top 4 Movies from " + startDate + " to " + endDate + ":");
        for (String[] movie : topMovies) {
            System.out.println("Movie: " + movie[0] + ", Quantity: " + movie[1]);
        }

        // Kiểm tra phương thức getFilmRevenueByDay
        List<String[]> filmRevenueByDay = revenueDAO.getFilmRevenueByDay(startDate, endDate);
        System.out.println("Film Revenue by Day from " + startDate + " to " + endDate + ":");
        for (String[] revenue : filmRevenueByDay) {
            System.out.println("Date: " + revenue[0] + ", Revenue: " + revenue[1]);
        }

        // Kiểm tra phương thức getTotalConcessionRevenue
        double totalConcessionRevenue = revenueDAO.getTotalConcessionRevenue(startDate, endDate);
        System.out.println("Total Concession Revenue from " + startDate + " to " + endDate + ": " + totalConcessionRevenue);

        // Kiểm tra phương thức getAverageValueOfConcessionBook
        double averageConcessionValue = revenueDAO.getAverageValueOfConcessionBook(startDate, endDate);
        System.out.println("Average Value of Concession Book from " + startDate + " to " + endDate + ": " + averageConcessionValue);

        // Kiểm tra phương thức getTop4Concessions
        List<String[]> topConcessions = revenueDAO.getTop3Concessions(startDate, endDate);
        System.out.println("Top 4 Concessions from " + startDate + " to " + endDate + ":");
        for (String[] concession : topConcessions) {
            System.out.println("Concession: " + concession[0] + ", Quantity: " + concession[1]);
        }

        // Kiểm tra phương thức getConcessionRevenueByDay
        List<String[]> concessionRevenueByDay = revenueDAO.getConcessionRevenueByDay(startDate, endDate);
        System.out.println("Concession Revenue by Day from " + startDate + " to " + endDate + ":");
        for (String[] revenue : concessionRevenueByDay) {
            System.out.println("Date: " + revenue[0] + ", Revenue: " + revenue[1]);
        }
    }

    public double getTotalConcessionRevenue(String startDate, String endDate) {
        double totalRevenue = 0;
        String sql = "SELECT SUM(co.quantity * c.price) as totalRevenue "
                + "FROM Concessions_Order co "
                + "INNER JOIN Ticket_Detail td ON co.ticket_id = td.id "
                + "INNER JOIN Concessions c ON co.concession_id = c.concessions_id "
                + "INNER JOIN Showtime st ON td.showtime_id = st.showtime_id "
                + "WHERE st.date >= ? AND st.date <= ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                totalRevenue = rs.getDouble("totalRevenue");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return totalRevenue;
    }

    public double getAverageValueOfConcessionBook(String startDate, String endDate) {
        double averageValue = 0;
        String sql = "SELECT AVG(co.quantity * c.price) as averageValue "
                + "FROM Concessions_Order co "
                + "INNER JOIN Ticket_Detail td ON co.ticket_id = td.id "
                + "INNER JOIN Concessions c ON co.concession_id = c.concessions_id "
                + "INNER JOIN Showtime st ON td.showtime_id = st.showtime_id "
                + "WHERE st.date >= ? AND st.date <= ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                averageValue = rs.getDouble("averageValue");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return averageValue;
    }

    public List<String[]> getTop3Concessions(String startDate, String endDate) {
        List<String[]> topConcessions = new ArrayList<>();
        String sql = "SELECT TOP 3 c.concessions_name, SUM(co.quantity) as quantity, c.image "
                + "FROM Concessions_Order co "
                + "INNER JOIN Concessions c ON co.concession_id = c.concessions_id "
                + "INNER JOIN Ticket_Detail td ON co.ticket_id = td.id "
                + "INNER JOIN Showtime st ON td.showtime_id = st.showtime_id "
                + "WHERE st.date >= ? AND st.date <= ? "
                + "GROUP BY c.concessions_name, c.image "
                + "ORDER BY quantity DESC";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String[] concession = new String[3];
                concession[0] = rs.getString("concessions_name");
                concession[1] = String.valueOf(rs.getInt("quantity"));
                concession[2] = rs.getString("image");
                topConcessions.add(concession);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return topConcessions;
    }

    public List<String[]> getConcessionRevenueByDay(String startDate, String endDate) {
        List<String[]> revenueByDay = new ArrayList<>();
        String sql = "SELECT st.date, SUM(co.quantity * c.price) as totalRevenue "
                + "FROM Concessions_Order co "
                + "INNER JOIN Concessions c ON co.concession_id = c.concessions_id "
                + "INNER JOIN Ticket_Detail td ON co.ticket_id = td.id "
                + "INNER JOIN Showtime st ON td.showtime_id = st.showtime_id "
                + "WHERE st.date >= ? AND st.date <= ? "
                + "GROUP BY st.date "
                + "ORDER BY st.date";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String[] revenue = new String[2];
                revenue[0] = rs.getString("date");
                revenue[1] = String.valueOf(rs.getDouble("totalRevenue"));
                revenueByDay.add(revenue);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return revenueByDay;
    }

}
