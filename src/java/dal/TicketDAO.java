/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Ticket;

/**
 *
 * @author tranh
 */
public class TicketDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public void AddTicket(Ticket ticket, int accountId) {
        String sql = ""
                + "INSERT INTO [dbo].[Ticket]\n"
                + "                                ([code]\n"
                + "                                ,[account_id]\n"
                + "                                ,[showtime_id]\n"
                + "                                ,[seat]\n"
                + "                                ,[combo]\n"
                + "                                ,[totalprice]\n"
                + "                                ,[date_book])\n"
                + "                          VALUES\n"
                + "(?,?,?,?,?,?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, ticket.getCode());
            stm.setInt(2, accountId);
            stm.setInt(3, ticket.getShowtimeId());
            stm.setString(4, ticket.getSeat());
            stm.setString(5, ticket.getCombo());
            stm.setInt(6, ticket.getTotalprice());
            stm.setString(7, ticket.getDate_book());
            stm.executeQuery();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public Ticket getTicket(String code) {
        String sql = ""
                + "SELECT [ticket_id]\n"
                + "                           ,[code]\n"
                + "                           ,[account_id]\n"
                + "                           ,[showtime_id]\n"
                + "                           ,[seat]\n"
                + "                           ,[combo]\n"
                + "                           ,[totalprice]\n"
                + "                           ,[payment]\n"
                + "                           ,[ticket_status]\n"
                + "                           ,[date_book]\n"
                + "                       FROM [dbo].[Ticket]\n"
                + "                       WHERE code = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            rs = stm.executeQuery();
            if (rs.next()) {
                Ticket tick = new Ticket();
                tick.setId(rs.getInt(1));
                tick.setCode(rs.getString(2));
                tick.setAccountId(rs.getInt(3));
                tick.setShowtimeId(rs.getInt(4));
                tick.setSeat(rs.getString(5));
                tick.setCombo(rs.getString(6));
                tick.setTotalprice(Integer.parseInt(rs.getString(7)));
                tick.setPayment(rs.getString(8));
                tick.setStatus(rs.getString(9));
                tick.setDate_book(rs.getString(10));
                return tick;
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }

    public void updateTicketStatus(String code, String status) {
        String sql = "UPDATE Ticket SET ticket_status = ? WHERE code = ?";
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
                Ticket ticket = new Ticket();
                ticket.setCode(rs.getString(2));
                ticket.setSeat(rs.getString(5));
                ticket.setCombo(rs.getString(6));
                ticket.setTotalprice(rs.getInt(7));
                ticket.setStatus(rs.getString(9));
                ticket.setDate_book(rs.getString(10));
                ticket.setShowtime(rs.getString(12));
                ticket.setMovieName(rs.getString(17));
                ticket.setMovieImage(rs.getString(21));
                return ticket;
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }
    
    public static void main(String[] args) {
        TicketDAO td = new TicketDAO();
        Ticket tic = td.getTicketByCode("QQ34M24");
        System.out.println(tic.getMovieName());
                
    }
}
