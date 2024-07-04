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
import model.Room;

/**
 *
 * @author thanh
 */
public class RoomDAO extends DBContext {

    public List<Room> getRoomsByShowtimeID(int showtimeID) {
        String sql = "SELECT r.room_id, r.room_name FROM Room r JOIN Showtime s ON r.room_id = s.room_id WHERE s.showtime_id = ?";
        List<Room> listRoom = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, showtimeID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int roomid = rs.getInt(1);
                String roomname = rs.getString(2);
                listRoom.add(new Room(roomid, roomname));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listRoom;
    }

   
    public Room getRoomByID(int room_id) {
        String sql = "select * from Room where room_id = ?";
        Room room;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, room_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int roomid = rs.getInt(1);
                String roomname = rs.getString(2);
                room = new Room(roomid, roomname);
                return room;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Room> getAllRooms() {
        String sql = "select * from Room";
        List<Room> listRoom = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int roomid = rs.getInt(1);
                String roomname = rs.getString(2);
                Room room = new Room(roomid, roomname);
                listRoom.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listRoom;
    }
}
