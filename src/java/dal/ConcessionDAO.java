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
    public List<Concession> getAllConcession(int page, int limit) {
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
                concession.setStatus(resultSet.getInt("status"));
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
                + "WHERE status = 1\n"
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
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public List<Concession> findByKeyword(String keyword, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String sql = "SELECT * FROM Concessions WHERE concessions_name LIKE ? OR CAST(price AS CHAR) LIKE ? OR CAST(quantity AS CHAR) LIKE ? ORDER BY concessions_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            String queryKeyword = "%" + keyword + "%";
            statement.setString(1, queryKeyword);
            statement.setString(2, queryKeyword);
            statement.setString(3, queryKeyword);
            statement.setInt(4, (page - 1) * limit);
            statement.setInt(5, limit);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setQuantity(resultSet.getInt("quantity"));
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByKeyword(String keyword) {
        String sql = "SELECT COUNT(*) FROM Concessions WHERE concessions_name LIKE ? OR CAST(price AS CHAR) LIKE ? OR CAST(quantity AS CHAR) LIKE ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            String queryKeyword = "%" + keyword + "%";
            statement.setString(1, queryKeyword);
            statement.setString(2, queryKeyword);
            statement.setString(3, queryKeyword);

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
    public void addConcession(Concession concession) {
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
    
    public List<Concession> getConcessionsOrderedByPricee(boolean ascending, int page, int limit) {
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
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByPricee(boolean ascending) {
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT COUNT(*) FROM Concessions\n";
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

    public List<Concession> getConcessionsOrderedByQuantityy(boolean ascending, int page, int limit) {
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
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public List<Concession> findByKeywordOrderedByPricee(String keyword, boolean ascending, int page, int limit) {
    List<Concession> listFound = new ArrayList<>();
    String order = ascending ? "ASC" : "DESC";
    String sql = "SELECT * FROM Concessions WHERE concessions_name LIKE ? ORDER BY price " 
                + order + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
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
            concession.setStatus(resultSet.getInt("status")); 
            listFound.add(concession);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return listFound;
}
    public List<Concession> findByKeywordOrderedByQuantityy(String keyword, boolean ascending, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT * FROM Concessions AND concessions_name LIKE ? ORDER BY quantity " + order + " OFFSET ? ROW FETCH NEXT ? ROWS ONLY";
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
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByQuantityy(boolean ascending) {
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT COUNT(*) FROM Concessions\n";
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
        ConcessionDAO concessionDAO = new ConcessionDAO();
        int page = 1;
    int limit = 100;

    // Gọi phương thức getAllConcession
    List<Concession> concessions = concessionDAO.getAllConcession(page, limit);

    // In kết quả
    System.out.println("Danh sách tất cả Concessions:");
    for (Concession concession : concessions) {
        System.out.println("ID: " + concession.getConcessions_id());
        System.out.println("Name: " + concession.getConcessions_name());
        System.out.println("Image: " + concession.getImage());
        System.out.println("Price: " + concession.getPrice());
        System.out.println("Quantity: " + concession.getQuantity());
        System.out.println("Status: " + concession.getStatus());
        System.out.println("-----------------------------");
    }

    // In tổng số bản ghi nếu cần
    int totalRecords = concessions.size();
    System.out.println("Tổng số bản ghi: " + totalRecords);
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    public List<Concession> getConcessionsOrderedByPrice(boolean ascending, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String order = ascending ? "ASC" : "DESC";
        String sql = "SELECT * FROM Concessions WHERE status = 1 ORDER BY price "
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
        String sql = "SELECT COUNT(*) FROM Concessions\n"
                + "WHERE status = 1";
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
        String sql = "SELECT * FROM Concessions Where status = 1 ORDER BY quantity " + order
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
        String sql = "SELECT * FROM Concessions WHERE status = 1 AND concessions_name LIKE ? ORDER BY price " 
                + order + " OFFSET ? ROW FETCH NEXT ? ROWS ONLY";
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
        String sql = "SELECT * FROM Concessions WHERE status = 1 AND concessions_name LIKE ? ORDER BY quantity " + order + " OFFSET ? ROW FETCH NEXT ? ROWS ONLY";
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
        String sql = "SELECT COUNT(*) FROM Concessions\n"
                + "WHERE status = 1";
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

    public int getTotalRecordCount() {
        String sql = "SELECT COUNT(*) AS total FROM Concessions WHERE status = 1";
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Concession> findByKeywordAndType(String keyword, String type, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String sql;
        if (type.equalsIgnoreCase("Combo")) {
            sql = "SELECT * FROM Concessions WHERE status = 1 AND concessions_name LIKE ? AND concessions_name LIKE ? ORDER BY concessions_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            sql = "SELECT * FROM Concessions WHERE status = 1 AND concessions_name LIKE ? AND concessions_name NOT LIKE ? ORDER BY concessions_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        }

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            if (type.equalsIgnoreCase("Combo")) {
                statement.setString(2, "%Combo%");
            } else {
                statement.setString(2, "%Combo%");
            }
            int offset = (page - 1) * limit;
            statement.setInt(3, offset);
            statement.setInt(4, limit);

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

    public int getTotalRecordsByKeywordAndType(String keyword, String type) {
        int totalRecords = 0;
        String sql;
        if (type.equalsIgnoreCase("Combo")) {
            sql = "SELECT COUNT(*) FROM Concessions WHERE status = 1 AND concessions_name LIKE ? AND concessions_name LIKE ?";
        } else {
            sql = "SELECT COUNT(*) FROM Concessions WHERE status = 1 AND concessions_name LIKE ? AND concessions_name NOT LIKE ?";
        }

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");
            if (type.equalsIgnoreCase("Combo")) {
                statement.setString(2, "%Combo%");
            } else {
                statement.setString(2, "%Combo%");
            }

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalRecords = resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    public List<Concession> getConcessionsByType(String type, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String sql;
        if (type.equalsIgnoreCase("Combo")) {
            sql = "SELECT * FROM Concessions WHERE status = 1 AND concessions_name LIKE ? ORDER BY concessions_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        } else {
            sql = "SELECT * FROM Concessions WHERE status = 1 AND concessions_name NOT LIKE ? ORDER BY concessions_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        }

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            if (type.equalsIgnoreCase("Combo")) {
                statement.setString(1, "%Combo%");
            } else {
                statement.setString(1, "%Combo%");
            }
            int offset = (page - 1) * limit;
            statement.setInt(2, offset);
            statement.setInt(3, limit);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Concession concession = new Concession();
                    concession.setConcessions_id(resultSet.getInt("concessions_id"));
                    concession.setConcessions_name(resultSet.getString("concessions_name"));
                    concession.setImage(resultSet.getString("image"));
                    concession.setPrice(resultSet.getFloat("price"));
                    concession.setQuantity(resultSet.getInt("quantity"));
                    listFound.add(concession);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByType(String type) {
        int totalRecords = 0;
        String sql;
        if (type.equalsIgnoreCase("Combo")) {
            sql = "SELECT COUNT(*) FROM Concessions WHERE status = 1 AND concessions_name LIKE ?";
        } else {
            sql = "SELECT COUNT(*) FROM Concessions WHERE status = 1 AND concessions_name NOT LIKE ?";
        }

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            if (type.equalsIgnoreCase("Combo")) {
                statement.setString(1, "%Combo%");
            } else {
                statement.setString(1, "%Combo%");
            }
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    totalRecords = resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    public void restockConcession(int id) {
        String sql = "UPDATE Concessions SET status = 1 WHERE concessions_id  = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Concession> findByName(String name, int page, int limit) {
    List<Concession> listFound = new ArrayList<>();
    String sql = "SELECT * FROM Concessions WHERE status = 1 AND concessions_name LIKE ? OR CAST(price AS CHAR) LIKE ? ORDER BY concessions_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    try {
        PreparedStatement statement = connection.prepareStatement(sql);
        String queryName = "%" + name + "%";
        statement.setString(1, queryName);
        statement.setString(2, queryName);
        statement.setInt(3, (page - 1) * limit);
        statement.setInt(4, limit);

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

public int getTotalRecordsByName(String name) {
    String sql = "SELECT COUNT(*) FROM Concessions WHERE status = 1 AND concessions_name LIKE ?";
    try {
        PreparedStatement statement = connection.prepareStatement(sql);
        String queryName = "%" + name + "%";
        statement.setString(1, queryName);

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt(1);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return 0;
}
    
    
}
