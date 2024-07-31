/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Theater;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Movie;
import model.Showtiming;

/**
 *
 * @author Admin
 */
public class TheaterDAO extends DBContext {

    public List<Theater> getAllTheater() {
        List<Theater> listType = new ArrayList<>();
        String sql = "select * from Theater";
        try {
            Theater typeMovie;
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);

                typeMovie = new Theater(id, name);
                listType.add(typeMovie);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listType;
    }
    PreparedStatement stm;
    ResultSet rs;

    public Theater getTheaterByTheaterID(int idTheater) {
        try {
            String sql = "select id, name from Theater where id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, idTheater);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                Theater theater = new Theater(id, name);

                return theater;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public List<Theater> getTheaterByMovie(int movieID) {
        List<Theater> theaterList = new ArrayList<>();
        String sql = "SELECT t.id AS theaterID, t.name AS theaterName "
                + "FROM Theater t "
                + "JOIN Showtime s ON t.id = s.theaterID "
                + "WHERE s.movie_id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, movieID);

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    int theaterID = rs.getInt("theaterID");
                    String theaterName = rs.getString("theaterName");
                    Theater theater = new Theater(theaterID, theaterName);
                    theaterList.add(theater);
                }
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        return theaterList;
    }

    public List<Theater> getTheaterByAll(int movieID, String date) {
        List<Theater> theaterList = new ArrayList<>();
        String sql = "SELECT t.id, t.name\n"
                + "FROM Showtime s\n"
                + "JOIN Theater t ON s.theaterID = t.id \n"
                + "WHERE s.movie_id = ?\n"
                + "  AND CAST(s.date AS DATE) = ?\n";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, movieID);
            stm.setString(2, date);

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    int theaterID = rs.getInt("id");
                    String theaterName = rs.getString("name");
                    Theater theater = new Theater(theaterID, theaterName);
                    theaterList.add(theater);
                }
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        return theaterList;

    public Vector<Theater> getAllTheaters() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Theater> theaters = new Vector<>();

        try {
            String sql = "SELECT * FROM Theater";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Theater theater = new Theater(id, name);
                theaters.add(theater);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TheaterDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(TheaterDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return theaters;
    }

    public Vector<Theater> searchTheatersByManagerName(String managerName) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Theater> theaters = new Vector<>();

        try {
            String sql = "SELECT t.* FROM Theater t "
                    + "JOIN Account a ON t.id = a.theaterID "
                    + "WHERE a.fullname LIKE ? AND a.role_id = 2";
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + managerName + "%");
            rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Theater theater = new Theater(id, name);
                theaters.add(theater);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TheaterDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(TheaterDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return theaters;

    }

    public static void main(String[] args) {
        TheaterDAO tdao = new TheaterDAO();
        List<Theater> t = tdao.getTheaterByAll(2, "2024-08-01");

        for (Theater theater : t) {
            System.out.println(theater.getName());
        }

    }

}
