/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.Seat;

/**
 *
 * @author thanh
 */
public class SeatDAO extends DBContext {

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
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seat_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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

    public void upDateSeatBooking(String seatName) {
        String sql = "UPDATE [dbo].[Seat]\n"
                + "   SET [status] = 'Booked'\n"
                + " WHERE seat_name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, seatName);
            st.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public List<Seat> getSeatsByRoomId(int roomid) {
        List<Seat> listSeat = new ArrayList<>();
        String sql = "SELECT * FROM Seat WHERE room_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int seat_id = rs.getInt(1);
                String seat_name = rs.getString(2);
                Float price = rs.getFloat(3);
                String status = "UnBook";
                Seat seat = new Seat(seat_id, seat_name, price, status);
                listSeat.add(seat);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return listSeat;
    }

//    public List<Seat> getSeatCustomer(int showtime, List<Seat> s) {
//        int[] seatId = null;
//        int count = 0;
//        String sql = "SELECT so.seat_id\n"
//                + "FROM Ticket_Detail td join Seat_Order so on td.ticket_id = so.ticket_id\n"
//                + "WHERE td.showtime_id = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, showtime);
//            ResultSet rs = st.executeQuery();
//            while(rs.next()){
//                seatId[count] = rs.getInt(1);
//                count++;
//            }
//            for (Seat s1 : s) {
//                for (int i : seatId) {
//                    if(s1.getSeat_id()==i){
//                        s1.setStatus("Booked");
//                    }
//                }
//            }
//        } catch (SQLException e) {
//        }
//        return s;
//    }
    public List<Seat> getSeatCustomer(int showtime, List<Seat> seats) {
        Set<Integer> seatIds = new HashSet<>();
        String sql = "SELECT so.seat_id "
                + "FROM Ticket_Detail td "
                + "JOIN Seat_Order so ON td.ticket_id = so.ticket_id "
                + "WHERE td.showtime_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, showtime);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    seatIds.add(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.getMessage(); // Or use a logger to log the exception
        }

        for (Seat seat : seats) {
            if (seatIds.contains(seat.getSeat_id())) {
                seat.setStatus("Booked");
            }
        }

        return seats;
    }
    
    public void Add_Revered(List<Seat> s, int show) {
        for (Seat seat : s) {
            addSeatReserved(seat.getSeat_id(), show);
        }
    }
    
    public void UpdateReserved(List<Seat> s, int show){
        for (Seat seat : s) {
            UpdateStatus_Reserved(seat.getSeat_id(), show);
        }
    }

    public void UpdateStatus_Reserved(int seatId, int show) {
        String sql = "UPDATE [dbo].[Seat_Reserved]\n"
                + "   SET [status] = 'on'\n"
                + " WHERE seat_id = ? and showtime_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seatId);
            st.setInt(2, show);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addSeatReserved(int seatId, int show) {
        LocalDateTime currentDateTime = LocalDateTime.now();
        // Định dạng ngày và giờ theo mẫu mong muốn
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // Chuyển ngày và giờ hiện tại thành chuỗi đã định dạng
        String formattedDateTime = currentDateTime.format(formatter);
        String sql = "INSERT INTO [dbo].[Seat_Reserved]\n"
                + "           ([seat_id]\n"
                + "           ,[showtime_id]\n"
                + "           ,[date]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, seatId);
            st.setInt(2, show);
            st.setString(3, formattedDateTime);
            st.setString(4, "off");
            st.executeQuery();
        } catch (SQLException e) {
        }
    }

    public List<Seat> getSeatReserved(List<Seat> s, int show) {
        Set<Integer> seatId = new HashSet<>();
        String sql = "SELECT * FROM Seat_Reserved WHERE CAST(date AS DATE) = CAST(GETDATE() AS DATE) and status = 'off' and showtime_id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, show);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                seatId.add(rs.getInt(2));
            }
        } catch (SQLException e) {
        }

        for (Seat seat : s) {
            if (seatId.contains(seat.getSeat_id())) {
                seat.setStatus("Reserved");
            }
        }

        return s;
    }

}
