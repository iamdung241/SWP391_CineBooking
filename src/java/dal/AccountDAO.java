/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DungTT and VuTA
 */
public class AccountDAO extends DBContext {

    public Account login(String input, String inputPassword) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [Account] WHERE (username = ? OR phone = ? OR email = ?) AND password = ?";
        try {
            // Mã hóa mật khẩu bằng MD5
            //String hashedPassword = md5(inputPassword);
            String hashedPassword = inputPassword;
            stm = connection.prepareStatement(sql);
            stm.setString(1, input);
            stm.setString(2, input);
            stm.setString(3, input);
            stm.setString(4, hashedPassword);  // Sử dụng mật khẩu đã mã hóa
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
                u.setTheaterID(rs.getInt("theaterID"));

                System.out.println(u);
                return u;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Hàm để mã hóa mật khẩu bằng MD5
    public String md5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : messageDigest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
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
                int theaterID = rs.getInt("theaterID");

                Account u = new Account(account_id, fullname, phone, email, username, password, role_id, theaterID);
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
                + "           ,[role_id]\n"
                + "           ,[theaterID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, account.getFullname());
            stm.setString(2, account.getPhone());
            stm.setString(3, account.getEmail());
            stm.setString(4, account.getUsername());
            // Mã hóa mật khẩu bằng MD5
            stm.setString(5, md5(account.getPassword()));
            stm.setInt(6, account.getRole_id());
            stm.setInt(7, account.getTheaterID());
            stm.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccountByID(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [Account] WHERE account_id = ?";
        try {
            // Prepare the SQL statement and set the account_id parameter
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                // Retrieve account details from the result set
                int account_id = rs.getInt("account_id");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                int theaterID = rs.getInt("theaterID");

                // Create an Account object and return it
                Account u = new Account(account_id, fullname, phone, email, username, password, role_id, theaterID);
                return u;
            }
        } catch (SQLException ex) {
            // Log any SQL exceptions
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the result set and statement
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // Return null if no account is found
        return null;
    }

    public void updateAccountRole(int account_id, int new_role_id) {
        PreparedStatement stm = null;
        String sql = "UPDATE [Account] SET role_id = ? WHERE account_id = ?";
        try {
            // Prepare the SQL statement and set the parameters for role_id and account_id
            stm = connection.prepareStatement(sql);
            stm.setInt(1, new_role_id);
            stm.setInt(2, account_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            // Log any SQL exceptions
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the statement
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public boolean usernameExists(String username) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [Account] WHERE username = ?";
        try {
            // Prepare the SQL statement and set the username parameter
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            // Return true if the username exists in the database
            return rs.next();
        } catch (SQLException ex) {
            // Log any SQL exceptions
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the result set and statement
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // Return false if the username does not exist
        return false;
    }

    public Vector<Account> searchAccounts(String name, String roleFilter, String theaterFilter) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Account> accounts = new Vector<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM [Account] WHERE 1=1");

        if (name != null && !name.isEmpty()) {
            sql.append(" AND fullname LIKE ?");
        }
        if (roleFilter != null && !roleFilter.isEmpty()) {
            sql.append(" AND role_id = ?");
        }
        if (theaterFilter != null && !theaterFilter.isEmpty()) {
            sql.append(" AND theaterID = ?");
        }

        try {
            stm = connection.prepareStatement(sql.toString());
            int paramIndex = 1;

            if (name != null && !name.isEmpty()) {
                stm.setString(paramIndex++, "%" + name + "%");
            }
            if (roleFilter != null && !roleFilter.isEmpty()) {
                stm.setInt(paramIndex++, Integer.parseInt(roleFilter));
            }
            if (theaterFilter != null && !theaterFilter.isEmpty()) {
                stm.setInt(paramIndex++, Integer.parseInt(theaterFilter));
            }

            rs = stm.executeQuery();
            while (rs.next()) {
                int account_id = rs.getInt("account_id");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String usernameDB = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                int theaterID = rs.getInt("theaterID");
                Account u = new Account(account_id, fullname, phone, email, usernameDB, password, role_id, theaterID);
                accounts.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return accounts;
    }

    public boolean phoneExists(String phone) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [Account] WHERE phone = ?";
        try {
            // Prepare the SQL statement and set the phone parameter
            stm = connection.prepareStatement(sql);
            stm.setString(1, phone);
            rs = stm.executeQuery();
            // Return true if the phone exists in the database
            return rs.next();
        } catch (SQLException ex) {
            // Log any SQL exceptions
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the result set and statement
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // Return false if the phone does not exist
        return false;
    }

    public boolean emailExists(String email) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [Account] WHERE email = ?";
        try {
            // Prepare the SQL statement and set the email parameter
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            // Return true if the email exists in the database
            return rs.next();
        } catch (SQLException ex) {
            // Log any SQL exceptions
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the result set and statement
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // Return false if the email does not exist
        return false;
    }

    public Account getAccountByUsername(String giveUsername) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [Account] WHERE username = ?";
        try {
            // Prepare the SQL statement and set the account_id parameter
            stm = connection.prepareStatement(sql);
            stm.setString(1, giveUsername);
            rs = stm.executeQuery();
            if (rs.next()) {
                // Retrieve account details from the result set
                int account_id = rs.getInt("account_id");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                int theaterID = rs.getInt("theaterID");

                // Create an Account object and return it
                Account u = new Account(account_id, fullname, phone, email, username, password, role_id, theaterID);
                return u;
            }
        } catch (SQLException ex) {
            // Log any SQL exceptions
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the result set and statement
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // Return null if no account is found
        return null;
    }

    public void updateAccount(int userID, Account acc) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [fullname] = ?,\n"
                + "       [phone] = ?,\n"
                + "       [email] = ?,\n"
                + "       [username] = ?\n"
                + " WHERE account_id = ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, acc.getFullname());
            stm.setString(2, acc.getPhone());
            stm.setString(3, acc.getEmail());
            stm.setString(4, acc.getUsername());
            stm.setInt(5, userID);
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updatePassword(String email, String password) {
        PreparedStatement stm = null;
        String sql = "UPDATE [Account] SET password = ? WHERE email = ?";
        try {
            // Mã hóa mật khẩu bằng MD5
            String hashedPassword = md5(password);

            // Prepare the SQL statement and set the parameters for password and email
            stm = connection.prepareStatement(sql);
            stm.setString(1, hashedPassword);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            // Log any SQL exceptions
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the statement
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updatePasswordByID(int userID, String password) {
        PreparedStatement stm = null;
        String sql = "UPDATE [Account] SET password = ? WHERE account_id = ?";
        try {
            // Encrypt password using MD5
            String hashedPassword = md5(password);

            // Prepare SQL statement and set parameters for password and account_id
            stm = connection.prepareStatement(sql);
            stm.setString(1, hashedPassword);
            stm.setInt(2, userID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            // Log SQL exceptions
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close statement
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public Account getAccountByEmail(String email) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [Account] WHERE email = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt("account_id"));
                account.setFullname(rs.getString("fullname"));
                account.setPhone(rs.getString("phone"));
                account.setEmail(rs.getString("email"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setRole_id(rs.getInt("role_id"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public void updatePasswordByEmail(String email, String password) {
        PreparedStatement stm = null;
        String sql = "UPDATE [Account] SET password = ? WHERE email = ?";
        try {
            String hashedPassword = md5(password); // Hash the password using MD5

            stm = connection.prepareStatement(sql);
            stm.setString(1, hashedPassword);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public Account getAccountByGoogleEmail(String email) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM [Account] WHERE email = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt("account_id"));
                account.setUsername(rs.getString("username"));
                account.setRole_id(rs.getInt("role_id"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public void insertUserFromGoogle(Account account) {
        PreparedStatement stm = null;
        String sql = "INSERT INTO [dbo].[Account] ([fullname], [phone], [email], [username], [password], [role_id], [theaterID]) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, account.getFullname());
            stm.setString(2, account.getPhone());
            stm.setString(3, account.getEmail());
            stm.setString(4, account.getUsername());
            stm.setString(5, ""); // Đặt mật khẩu trống cho tài khoản Google
            stm.setInt(6, account.getRole_id());
            stm.setInt(7, account.getTheaterID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
