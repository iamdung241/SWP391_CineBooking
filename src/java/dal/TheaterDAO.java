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
     public static void main(String[] args) {
        TheaterDAO tdao = new TheaterDAO();
        List<Theater> list = tdao.getAllTheater();
        for (Theater t : list) {
            System.out.println(t.getName());
        }
    }
}
