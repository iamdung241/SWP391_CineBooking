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
import model.Concession;

/**
 *
 * @author Admin
 */
public class ConcessionDAO extends DBContext{
    //author: thanh 
    public List<Concession> getAllConcessions() {
        List<Concession> listConcession = new ArrayList();
        String sql = "SELECT c.concessions_id, c.concessions_name, c.image, c.price, c.quantity FROM Concessions c";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                int concessions_id = rs.getInt(1);
                String concessions_name = rs.getString(2);
                String image = rs.getString(3);
                float price = rs.getFloat(4);
                int quality = rs.getInt(5);
                Concession concession = new Concession(concessions_id, concessions_name, image, price, quality);
                listConcession.add(concession);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return listConcession;
    }
}
