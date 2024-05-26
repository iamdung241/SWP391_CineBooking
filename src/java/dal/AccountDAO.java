/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DungTT
 */
public class AccountDAO extends DBContext {

    public Account login(String inputUsername, String inputPassword) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "select * from [Account] where username = ? and password = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, inputUsername);
            stm.setString(2, inputPassword);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account u = new Account();
                u.setAccount_id(rs.getInt("account_id"));
                u.setFullname(rs.getString("fullname"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole_id(rs.getInt("role_id"));

                System.out.println(u);
                return u;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Vector<Account> getAllAccount() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Account> account = new Vector<>();
        String sql = "select * from [Account]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt("account_id");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");

                Account u = new Account(account_id, fullname, phone, email, username, password, role_id);
                account.add(u);
            }
            return account;

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertUser(Account account) {
        PreparedStatement stm = null;

        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([fullname]\n"
                + "           ,[phone]\n"
                + "           ,[email]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, account.getFullname());
            stm.setString(2, account.getPhone());
            stm.setString(3, account.getEmail());
            stm.setString(4, account.getUsername());
            stm.setString(5, account.getPassword());
            stm.setInt(6, account.getRole_id());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
