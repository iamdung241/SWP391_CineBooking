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
import model.Seat;
import model.Showtiming;
import model.Ticket;

/**
 *
 * @author tranh
 */
public class TicketDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public List<Seat> getSeatBooked(String seat) {
        List<Seat> seats = new ArrayList<>();
        String[] seatArray = seat.split(",");
        //String sql = "";
        StringBuilder sqlBuilder = new StringBuilder("SELECT [seat_id], [seat_name], [price], [room_id] FROM [dbo].[Seat] WHERE seat_name IN (");
        for (int i = 0; i < seatArray.length; i++) {
            sqlBuilder.append("?");
            if (i < seatArray.length - 1) {
                sqlBuilder.append(", ");
            }
        }
        sqlBuilder.append(")");
        String sql = sqlBuilder.toString();
        try {
            stm = connection.prepareStatement(sql);
            for (int i = 0; i < seatArray.length; i++) {
                stm.setString(i + 1, seatArray[i]);
            }

            rs = stm.executeQuery();
            while (rs.next()) {
                int seatId = rs.getInt("seat_id");
                String seatName = rs.getString("seat_name");
                float price = rs.getFloat("price");
                int roomId = rs.getInt("room_id");
                Seat s = new Seat(seatId, seatName, price, roomId);
                seats.add(s);
            }
        } catch (SQLException e) {
        }
        return seats;
    }

    public int getIdTicketByCode(String code) {
        String sql = "SELECT [ticket_id]\n"
                + "      ,[code]\n"
                + "      ,[account_id]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Ticket]\n"
                + "  WHERE code = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            rs = stm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                return id;
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return -1;
    }

    public void addSeatOrder(Seat s, int ticketId) {
        String sql = "INSERT INTO [dbo].[Seat_Order]\n"
                + "           ([ticket_id]\n"
                + "           ,[seat_id])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, ticketId);
            stm.setInt(2, s.getSeat_id());
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void addConcessionOrder(Concession c, int ticketID) {
        String sql = "INSERT INTO [dbo].[Concessions_Order]\n"
                + "           ([ticket_id]\n"
                + "           ,[concession_id]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, ticketID);
            stm.setInt(2, c.getConcessions_id());
            stm.setInt(3, c.getQuantity());
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void AddTicket(Ticket ticket, int accountId, int theaterID) {
        String sql = "INSERT INTO [dbo].[Ticket]\n"
                + "           ([code]\n"
                + "           ,[account_id]\n"
                + "           ,[theaterID])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, ticket.getCode());
            stm.setInt(2, accountId);
            stm.setInt(3, theaterID);
            stm.executeQuery();
        } catch (SQLException e) {
            e.getMessage();
        }

        int tickId = getIdTicketByCode(ticket.getCode());
        String sql2 = "INSERT INTO [dbo].[Ticket_Detail]\n"
                + "           ([ticket_id]\n"
                + "           ,[showtime_id]\n"
                + "           ,[totalprice]\n"
                + "           ,[date_book])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            stm = connection.prepareStatement(sql2);
            stm.setInt(1, tickId);
            stm.setInt(2, ticket.getShowtimeId());
            stm.setInt(3, ticket.getTotalprice());
            stm.setString(4, ticket.getDate_book());
            stm.executeQuery();
        } catch (SQLException e) {
            e.getMessage();
        }

        for (Seat s : ticket.getSeat()) {
            addSeatOrder(s, tickId);
        }

        if (ticket.getCombo() != null) {
            for (Concession c : ticket.getCombo()) {
                addConcessionOrder(c, tickId);
            }
        }
    }

    public List<Seat> getSeatOrderBy_TicketId(int Tid) {
        List<Seat> list = new ArrayList<>();
        String sql = "SELECT s.seat_id,s.seat_name,s.price,s.room_id\n"
                + "\n"
                + "  FROM Ticket_Detail td join Seat_Order so on td.ticket_id = so.ticket_id \n"
                + "       join Seat s on s.seat_id = so.seat_id\n"
                + "  WHERE td.ticket_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Tid);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                float price = rs.getInt(3);
                int roomID = rs.getInt(4);
                list.add(new Seat(id, name, price, roomID));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return list;
    }

    public List<Concession> getConcessionsOrderBy_TicketId(int Tid) {
        List<Concession> list = new ArrayList<>();
        String sql = "SELECT c.concessions_id , c.concessions_name , c.image , c.price , co.quantity , c.status \n"
                + "\n"
                + "  FROM Ticket_Detail td join Concessions_Order co on td.ticket_id = co.ticket_id \n"
                + "       join Concessions c on co.concession_id = c.concessions_id\n"
                + "  WHERE td.ticket_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, Tid);
            rs = stm.executeQuery();
            while (rs.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(rs.getInt(1));
                concession.setConcessions_name(rs.getString(2));
                concession.setImage(rs.getString(3));
                concession.setPrice(rs.getFloat(4));
                concession.setQuantity(rs.getInt(5));
                list.add(concession);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return list;
    }

    public Showtiming getShowtimeByTicketID(int ticket_id) {
        String sql = "select * from Showtime s \n"
                + "                join Ticket_Detail td\n"
                + "                on td.showtime_id = s.showtime_id\n"
                + "                join Movie m\n"
                + "                on m.movie_id = s.movie_id\n"
                + "				join Room r on r.room_id = s.room_id\n"
                + "                where td.ticket_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, ticket_id);
            rs = stm.executeQuery();
            if (rs.next()) {
                Showtiming showtime = new Showtiming();
                showtime.setShowtime_id(rs.getInt(1));
                showtime.setShowtiming(rs.getString(2));
                showtime.setMovie_name(rs.getString(13));
                showtime.setMovieImage(rs.getString(17));
                showtime.setMovieAge(rs.getString(20));
                showtime.setDate(rs.getString(6));
                showtime.setRoom_name(rs.getString("room_name"));
                return showtime;
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }

    public Ticket getTicket(String code) {
        String sql = "SELECT t.ticket_id,\n"
                + "       t.code,\n"
                + "       t.account_id,\n"
                + "       t.status,\n"
                + "       td.showtime_id,\n"
                + "       td.totalprice,\n"
                + "       td.date_book,\n"
                + "       th.name, r.room_name\n"
                + "FROM dbo.Ticket t\n"
                + "JOIN Ticket_Detail td ON t.ticket_id = td.ticket_id\n"
                + "JOIN Theater th ON th.id = t.theaterID \n"
                + "join Showtime s on s.showtime_id = td.showtime_id \n"
                + "join room r on r.room_id = s.room_id \n"
                + "WHERE t.code = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            rs = stm.executeQuery();
            if (rs.next()) {
                int Tid = rs.getInt(1);
                Ticket tick = new Ticket();
                tick.setId(rs.getInt(1));
                tick.setCode(rs.getString(2));
                tick.setAccountId(rs.getInt(3));
                tick.setStatus(rs.getString(4));
                tick.setShowtimeId(rs.getInt(5));
                tick.setTotalprice(Integer.parseInt(rs.getString(6)));
                tick.setDate_book(rs.getString(7));
                tick.setTheaterName(rs.getString(8));
                tick.setRoomName(rs.getString(9));
                tick.setSeat(getSeatOrderBy_TicketId(Tid));
                tick.setCombo(getConcessionsOrderBy_TicketId(Tid));
                tick.setShowtime(getShowtimeByTicketID(Tid));
                tick.setMovieName(getShowtimeByTicketID(Tid).getMovie_name());
                tick.setMovieImage(getShowtimeByTicketID(Tid).getMovieImage());
                tick.setMovieAge(getShowtimeByTicketID(Tid).getMovieAge());
                return tick;
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }

    public void updateTicketStatus(String code, String status) {
        String sql = "UPDATE Ticket SET status = ? WHERE code = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, code);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public Ticket getTicketByCode(String code) {
        String sql = "Select * from Ticket t \n"
                + "join Showtime s on s.showtime_id = t.showtime_id\n"
                + "join Movie m on m.movie_id = s.movie_id\n"
                + "where t.code = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            rs = stm.executeQuery();
            while (rs.next()) {

            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }

    public List<Ticket> getTicketsByUserId(int userId) {
        List<Ticket> tickets = new ArrayList<>();
        String sql = "SELECT t.ticket_id, t.code, t.account_id, t.status, td.showtime_id, td.totalprice, td.date_book "
                + "FROM Ticket t "
                + "JOIN Ticket_Detail td ON t.ticket_id = td.ticket_id "
                + "WHERE t.account_id = ?";
        try (PreparedStatement stms = connection.prepareStatement(sql)) {
            stms.setInt(1, userId);
            try (ResultSet rs1 = stms.executeQuery()) {
                while (rs1.next()) {
                    int Tid = rs1.getInt(1);
                    Ticket tick = new Ticket();
                    tick.setId(Tid);
                    tick.setCode(rs1.getString(2));
                    tick.setAccountId(rs1.getInt(3));
                    tick.setStatus(rs1.getString(4));
                    tick.setShowtimeId(rs1.getInt(5));
                    tick.setTotalprice(rs1.getInt(6));
                    tick.setDate_book(rs1.getString(7));
                    tick.setSeat(getSeatOrderBy_TicketId(Tid));
                    tick.setCombo(getConcessionsOrderBy_TicketId(Tid));
                    Showtiming showtime = getShowtimeByTicketID(Tid);
                    tick.setShowtime(showtime);
                    tick.setMovieName(showtime.getMovie_name());
                    tick.setMovieImage(showtime.getMovieImage());
                    tickets.add(tick);
                }
            }
        } catch (SQLException e) {
            e.getMessage(); // Or use a logger to log the exception
        }
        return tickets;
    }

    public static void main(String[] args) {
//        List<Ticket> list = new TicketDAO().getTicketsByUserId(4);
//        for (Ticket ticket : list) {
//            System.out.println(ticket.toString());
//        }
//        List<Seat> lists = new TicketDAO().getSeatOrderBy_TicketId(4);
//        for (Seat seat : lists) {
//            System.out.println(seat.toString());
//        }

        List<Seat> s = new TicketDAO().getSeatBooked("B2,A1");
        for (Seat seat : s) {
            System.out.println(seat.toString());
        }
    }

}
