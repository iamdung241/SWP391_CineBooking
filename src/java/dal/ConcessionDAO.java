/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import constant.CommonConst;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Concession;

/**
 *
 * @author Son
 */
public class ConcessionDAO extends DBContext {

    ResultSet resultSet;
    PreparedStatement statement;

    /**
     * Retrieves all concession items from the database.
     *
     * @return a list containing all concession items found in the database
     */
    //author: thanh
    public List<Concession> getAllConcessions() {
        List<Concession> listFound = new ArrayList<>();
        String sql = "  SELECT * FROM Concessions WHERE status = 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setQuantity(resultSet.getInt("quantity"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listFound;
    }

    public List<Concession> getAllConcessions(int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String sql = "  SELECT * FROM Concessions\n"
                + "  ORDER BY[concessions_id]\n"
                + "  OFFSET ? ROWS\n"
                + "  FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, (page - 1) * limit);
            statement.setInt(2, limit);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setQuantity(resultSet.getInt("quantity"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public List<Concession> findByKeyword(String keyword, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String sql = "SELECT * FROM Concessions WHERE concessions_name LIKE ? OR image LIKE ? OR CAST(price AS CHAR) LIKE ? OR CAST(quantity AS CHAR) LIKE ? ORDER BY concessions_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            String queryKeyword = "%" + keyword + "%";
            statement.setString(1, queryKeyword);
            statement.setString(2, queryKeyword);
            statement.setString(3, queryKeyword);
            statement.setString(4, queryKeyword);
            statement.setInt(5, (page - 1) * limit);
            statement.setInt(6, limit);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setQuantity(resultSet.getInt("quantity"));
                listFound.add(concession);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByKeyword(String keyword) {
        String sql = "SELECT COUNT(*) FROM Concessions WHERE concessions_name LIKE ? OR image LIKE ? OR CAST(price AS CHAR) LIKE ? OR CAST(quantity AS CHAR) LIKE ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            String queryKeyword = "%" + keyword + "%";
            statement.setString(1, queryKeyword);
            statement.setString(2, queryKeyword);
            statement.setString(3, queryKeyword);
            statement.setString(4, queryKeyword);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Adds a new concession item to the database.
     *
     * @param concession the concession item to be added to the database
     */
    public void add(Concession concession) {
        String sql = "INSERT INTO Concessions (concessions_name, image, price, quantity) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, concession.getConcessions_name());
            statement.setString(2, concession.getImage());
            statement.setFloat(3, concession.getPrice());
            statement.setInt(4, concession.getQuantity());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Updates an existing concession item in the database with new information.
     *
     * @param concession the concession item containing the updated information
     */
    public void editConcession(Concession concession) {
        String sql = "UPDATE Concessions SET concessions_name = ?, image = ?, price = ?, quantity = ? WHERE concessions_id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, concession.getConcessions_name());
            statement.setString(2, concession.getImage());
            statement.setFloat(3, concession.getPrice());
            statement.setInt(4, concession.getQuantity());
            statement.setInt(5, concession.getConcessions_id());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteConcession(int id) {
        String sql = "UPDATE Concessions SET status = 0 WHERE concessions_id  = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Concession> getConcessionsOrderedByPrice(boolean ascending, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT * FROM Concessions ORDER BY price "
                + order + " OFFSET ? ROW FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, (page - 1) * limit);
            statement.setInt(2, limit);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setQuantity(resultSet.getInt("quantity"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByPrice(boolean ascending) {
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT COUNT(*) FROM Concessions";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Concession> getConcessionsOrderedByQuantity(boolean ascending, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT * FROM Concessions ORDER BY quantity " + order
                + " OFFSET ? ROW FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, (page - 1) * limit);
            statement.setInt(2, limit);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setQuantity(resultSet.getInt("quantity"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public List<Concession> findByKeywordOrderedByPrice(String keyword, boolean ascending, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT * FROM Concessions WHERE concessions_name LIKE ? ORDER BY price " + order + " OFFSET ? ROW FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            statement.setInt(2, (page - 1) * limit);
            statement.setInt(3, limit);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setQuantity(resultSet.getInt("quantity"));
                listFound.add(concession);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public List<Concession> findByKeywordOrderedByQuantity(String keyword, boolean ascending, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT * FROM Concessions WHERE concessions_name LIKE ? ORDER BY quantity " + order + " OFFSET ? ROW FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            statement.setInt(2, (page - 1) * limit);
            statement.setInt(3, limit);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setQuantity(resultSet.getInt("quantity"));
                listFound.add(concession);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByQuantity(boolean ascending) {
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT COUNT(*) FROM Concessions";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        ConcessionDAO dao = new ConcessionDAO();

        // Test getConcessionsOrderedByQuantity
        int page = 1;
        int limit = 10;
        boolean ascending = true;

        List<Concession> concessions = dao.getConcessionsOrderedByQuantity(ascending, page, limit);
        System.out.println("Concessions ordered by quantity (ascending):");
        for (Concession concession : concessions) {
            System.out.println(concession);
        }

        // Test getTotalRecordsByQuantity
        int totalRecords = dao.getTotalRecordsByQuantity(ascending);
        System.out.println("Total records by quantity (ascending): " + totalRecords);

        ascending = false;
        concessions = dao.getConcessionsOrderedByQuantity(ascending, page, limit);
        System.out.println("Concessions ordered by quantity (descending):");
        for (Concession concession : concessions) {
            System.out.println(concession);
        }

        totalRecords = dao.getTotalRecordsByQuantity(ascending);
        System.out.println("Total records by quantity (descending): " + totalRecords);
    }

    public int getTotalRecordCount() {
        String sql = "SELECT COUNT(*) AS total FROM Concessions";
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
