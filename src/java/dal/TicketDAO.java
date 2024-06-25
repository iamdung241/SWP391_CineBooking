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
import model.Ticket;

/**
 *
 * @author tranh
 */
public class TicketDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs ;

    public void AddTicket(Ticket ticket,int accountId) {
        String sql = "INSERT INTO [dbo].[Ticket]\n"
                + "           ([account_id]\n"
                + "           ,[showtime_id]\n"
                + "           ,[seat]\n"
                + "           ,[combo]\n"
                + "           ,[totalprice]\n"
                + "           )\n"
                + " VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            stm.setInt(2, ticket.getShowtimeId());
            stm.setString(3, ticket.getSeat());
            stm.setString(4, ticket.getCombo());
            stm.setInt(5, ticket.getTotalprice());
            stm.executeQuery();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public void getTicket() {
        String sql = "";
        try {
            stm = connection.prepareStatement(sql);
            stm.executeQuery();
        } catch (SQLException e) {
            e.getMessage();
        }
    }
    
    public void updateTicketStatus(String code, String status) {
        String sql = "UPDATE Ticket SET ticket_status = ? WHERE code = ?";
        try{
            stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, code);
            stm.executeUpdate();
        } catch(SQLException e) {
            e.getMessage();
        }
    }
    
    public Ticket getTicketByCode(String code ) {
        String sql = "select * from Ticket t join Showtime s on t.showtime_id = s.showtime_id where t.code = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, code);
            rs = stm.executeQuery();
            while(rs.next()) {
                String codeTicket = rs.getString(2);
                String seat = rs.getString(5);
                int totalprice = rs.getInt(7);
                String combo = rs.getString(6);
                String payment = rs.getString(8);
                String status = rs.getString(9);
                String date_book = rs.getString(10);
                String showtime = rs.getString(12);
                
                Ticket ticket = new Ticket(code, seat, totalprice, combo, payment, status, date_book, showtime);
                return ticket;
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }
}
