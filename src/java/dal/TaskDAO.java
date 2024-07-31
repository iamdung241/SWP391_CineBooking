package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Account;
import model.Task;
import model.Theater;

public class TaskDAO extends DBContext {

    public ArrayList<Task> getAllTasks(String status, String keyword) {
        ArrayList<Task> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[status]\n"
                + "      ,[acountId]\n"
                + "      ,[createdAt]\n"
                + "      ,[finishedAt]\n"
                + "  FROM [Task] "
                + " WHERE 1 = 1";

        if (!status.equals("")) {
            sql += " AND [status] = '" + status + "'";
        }
        if (!keyword.equals("")) {
            sql += " AND [title] like '%" + keyword + "%'";
        }
        sql += " ORDER BY [createdAt] asc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Task t = new Task(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                list.add(t);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Task> getTaskPage(String status, String keyword, int currentPage, int itemPerPage) {
        ArrayList<Task> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[status]\n"
                + "      ,[acountId]\n"
                + "      ,[createdAt]\n"
                + "      ,[finishedAt]\n"
                + "  FROM [Task] "
                + " WHERE 1 = 1";
        if (!status.equals("")) {
            sql += " AND [status] = '" + status + "'";
        }
        if (!keyword.equals("")) {
            sql += " AND [title] like '%" + keyword + "%'";
        }
        sql += " ORDER BY ID asc";
        sql += " OFFSET " + ((currentPage - 1) * itemPerPage) + " ROWS " + "FETCH NEXT " + itemPerPage + " ROWS ONLY ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Task t = new Task(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                list.add(t);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Task getTaskById(String id) {
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[status]\n"
                + "      ,[acountId]\n"
                + "      ,[createdAt]\n"
                + "      ,[finishedAt]\n"
                + "  FROM [Task] "
                + " WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Task t = new Task(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
                return t;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Theater> getListThreaters() {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [CineBooking].[dbo].[Theater]";
        ArrayList<Theater> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Theater t = new Theater(rs.getInt(1), rs.getString(2));
                list.add(t);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Account> getAccountByTheater(String theaterId) {
        String sql = "SELECT  [account_id]\n"
                + "      ,[fullname]\n"
                + "      ,[phone]\n"
                + "      ,[email]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[theaterID]\n"
                + "  FROM [CineBooking].[dbo].[Account]\n"
                + "  WHERE role_id in (3,5) AND theaterID = ?";
        ArrayList<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, theaterId);
            ResultSet rs = st.executeQuery();

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
                list.add(u);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Account> getAllAccounts(String theaterId) {
        String sql = "SELECT  [account_id]\n"
                + "      ,[fullname]\n"
                + "      ,[phone]\n"
                + "      ,[email]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[theaterID]\n"
                + "  FROM [CineBooking].[dbo].[Account]\n"
                + "  WHERE role_id in (3,5) AND theaterID = ?";
        ArrayList<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, theaterId);
            ResultSet rs = st.executeQuery();

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
                list.add(u);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getAccountById(String accountId) {
        String sql = "SELECT  [account_id]\n"
                + "      ,[fullname]\n"
                + "      ,[phone]\n"
                + "      ,[email]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[theaterID]\n"
                + "  FROM [CineBooking].[dbo].[Account]\n"
                + "  WHERE role_id in (3,5) AND [account_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, accountId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int account_id = rs.getInt("account_id");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role_id = rs.getInt("role_id");
                int theaterID = rs.getInt("theaterID");

                Account u = new Account(account_id, fullname, phone, email, username, password, role_id, theaterID);
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertTask(String title, String description, String accountId) {
        String sql = "INSERT INTO [dbo].[Task]\n"
                + "           ([title]\n"
                + "           ,[description]\n"
                + "           ,[acountId])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, description);
            st.setString(3, accountId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateTask(String Id, String title, String description, String accountId, String status) {
        String sql = "UPDATE [dbo].[Task]\n"
                + "   SET [title] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[acountId] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, description);
            st.setString(3, status);
            st.setString(4, accountId);
            st.setString(5, Id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean deleteTask(String id) {
        String sql = "DELETE FROM [dbo].[Task]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

}
