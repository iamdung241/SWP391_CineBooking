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
            stm.setInt(3, ticket.getShowtime());
            stm.setString(4, ticket.getSeat());
            stm.setString(5, ticket.getCombo());
            stm.setInt(6, ticket.getTotalprice());
            stm.setString(7, ticket.getDate());
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
                tick.setShowtime(rs.getInt(4));
                tick.setSeat(rs.getString(5));
                tick.setCombo(rs.getString(6));
                tick.setTotalprice(Integer.parseInt(rs.getString(7)));
                tick.setPayment(rs.getString(8));
                tick.setStatus(rs.getString(9));
                tick.setDate(rs.getString(10));
                return tick;
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }
}
