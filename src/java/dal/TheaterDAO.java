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
import model.Movie;

/**
 *
 * @author Admin
 */
public class TheaterDAO extends DBContext{
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
     public static void main(String[] args) {
        TheaterDAO tdao = new TheaterDAO();
        Theater t = tdao.getTheaterByTheaterID(1);
        
            System.out.println(t.getName());
        
    }

    
}
