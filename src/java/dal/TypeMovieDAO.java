/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.TypeMovie;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class TypeMovieDAO extends DBContext {

    public List<TypeMovie> getAllType() {
        List<TypeMovie> listType = new ArrayList<>();
        String sql = "select * from TypeMovie";
        try {
            TypeMovie typeMovie;
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int type_id = rs.getInt(1);
                String type_name = rs.getString(2);

                typeMovie = new TypeMovie(type_id, type_name);
                listType.add(typeMovie);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listType;
    }

    public static void main(String[] args) {
        List<TypeMovie> data = new TypeMovieDAO().getAllType();
        for (TypeMovie movie : data) {
            System.out.println(movie.toString());
        }
    }
}
