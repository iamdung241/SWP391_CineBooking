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
import model.Seat;

/**
 *
 * @author thanh
 */
public class SeatDAO extends DBContext{
    public List<Seat> getAllSeats() {
        List<Seat> listSeat = new ArrayList<>();
        String sql = "SELECT * FROM Seat";
        try {
            Seat seat;
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int seat_id = rs.getInt(1);
                String seat_name = rs.getString(2);
                Float price = rs.getFloat(3);
                String status = rs.getString(4);
                seat = new Seat(seat_id, seat_name, price, status);
                listSeat.add(seat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listSeat;
    }
    
    
    public Seat getSeatByID(int seat_id) {
        String sql = "SELECT * FROM Seat WHERE seat_id = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seat_id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                int idSeat = rs.getInt(1);
                String seat_name = rs.getString(2);
                Float price = rs.getFloat(3);
                String status = rs.getString(4);
                Seat seat = new Seat(idSeat, seat_name, price, status);
                return seat;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Seat> getSeatsByCharacterName(String roomName) {
        List<Seat> listSeat = new ArrayList<>();
        String sql = "SELECT * FROM Seat WHERE seat_name LIKE ?";
        try {
            String character = roomName.substring(0, 1) + "%";
            Seat seat;
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, character);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int seat_id = rs.getInt(1);
                String seat_name = rs.getString(2);
                Float price = rs.getFloat(3);
                String status = rs.getString(4);
                seat = new Seat(seat_id, seat_name, price, status);
                listSeat.add(seat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listSeat;
    }
    
    public static void main(String[] args) {
        List<Seat> list = new SeatDAO().getSeatsByCharacterName("Venus");
        for (Seat seat : list) {
            System.out.println(seat.getSeat_name());
        }
    }
}
