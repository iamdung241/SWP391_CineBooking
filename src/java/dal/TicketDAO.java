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
            stm.setInt(2, ticket.getShowtime());
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
}
