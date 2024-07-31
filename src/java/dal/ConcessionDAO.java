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
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }
    public List<Concession> getAllConcessionsAdmin(int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String sql = "  SELECT * FROM Concessions\n"
                + "  ORDER BY[concessions_id] DESC\n"
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
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }
    
    public List<Concession> getAllConcessionsHome(int page, int limit) {
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
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }
    
    public Concession getConcessionByID(int concession_id) {
        String sql = "SELECT * FROM Concessions WHERE concessions_id = ?";
        Concession concession;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, concession_id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                int concessionId = rs.getInt(1);
                String concessionName = rs.getString(2);
                String image = rs.getString(3);
                float price = rs.getFloat(4);
                concession = new Concession(concession_id, concessionName, image, price);
                return concession;
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    //HUyTQ
    public Concession getConcessionByName(String name) {
        String sql = "SELECT * FROM Concessions WHERE concessions_name = ?";
        Concession concession;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                int concessionId = rs.getInt(1);
                String concessionName = rs.getString(2);
                String image = rs.getString(3);
                float price = rs.getFloat(4);
                concession = new Concession(concessionId, concessionName, image, price);
                return concession;
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Concession> findByKeywordAdmin(String keyword, int page, int limit) {
        List<Concession> listFound = new ArrayList<>();
        String sql = "SELECT * FROM Concessions WHERE concessions_name LIKE ? OR CAST(price AS CHAR) LIKE ? ORDER BY concessions_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            String queryKeyword = "%" + keyword + "%";
            statement.setString(1, queryKeyword);
            statement.setString(2, queryKeyword);
            statement.setInt(3, (page - 1) * limit);
            statement.setInt(4, limit);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByKeyword(String keyword) {
        String sql = "SELECT COUNT(*) FROM Concessions WHERE concessions_name LIKE ? OR CAST(price AS CHAR) LIKE ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            String queryKeyword = "%" + keyword + "%";
            statement.setString(1, queryKeyword);
            statement.setString(2, queryKeyword);

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
        String sql = "INSERT INTO Concessions (concessions_name, image, price) VALUES (?, ?, ?)";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, concession.getConcessions_name());
            statement.setString(2, concession.getImage());
            statement.setFloat(3, concession.getPrice());
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
        String sql = "UPDATE Concessions SET concessions_name = ?, image = ?, price = ? WHERE concessions_id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, concession.getConcessions_name());
            statement.setString(2, concession.getImage());
            statement.setFloat(3, concession.getPrice());
            statement.setInt(4, concession.getConcessions_id());
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
    
    public List<Concession> getConcessionsOrderedByPriceAdmin(boolean ascending, int page, int limit) {
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
                concession.setStatus(resultSet.getInt("status"));
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByPriceAdmin(boolean ascending) {
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

    public List<Concession> findByKeywordOrderedByPriceAdmin(String keyword, boolean ascending, int page, int limit) {
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
            concession.setStatus(resultSet.getInt("status")); 
            listFound.add(concession);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return listFound;
}
    
    
    
    
    
    
    
    
    
    
    
    
    public static void main(String[] args) {
        ConcessionDAO concessionDAO = new ConcessionDAO();
        int page = 1;
    int limit = 100;

    // Gọi phương thức getAllConcession
    List<Concession> concessions = concessionDAO.getAllConcessionsAdmin(page, limit);

    // In kết quả
    System.out.println("Danh sách tất cả Concessions:");
    for (Concession concession : concessions) {
        System.out.println("ID: " + concession.getConcessions_id());
        System.out.println("Name: " + concession.getConcessions_name());
        System.out.println("Image: " + concession.getImage());
        System.out.println("Price: " + concession.getPrice());
        System.out.println("Status: " + concession.getStatus());
        System.out.println("-----------------------------");
    }

    // In tổng số bản ghi nếu cần
    int totalRecords = concessions.size();
    System.out.println("Tổng số bản ghi: " + totalRecords);
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    public List<Concession> getConcessionsOrderedByPriceHome(boolean ascending, int page, int limit) {
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
                listFound.add(concession);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByPriceHome(boolean ascending) {
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

   
    public List<Concession> findByKeywordOrderedByPriceHome(String keyword, boolean ascending, int page, int limit) {
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
                listFound.add(concession);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
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

    public List<Concession> findByKeywordAndTypeHome(String keyword, String type, int page, int limit) {
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
                listFound.add(concession);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByKeywordAndTypeHome(String keyword, String type) {
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

    public List<Concession> getConcessionsByTypeHome(String type, int page, int limit) {
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
                    listFound.add(concession);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listFound;
    }

    public int getTotalRecordsByTypeHome(String type) {
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

    public List<Concession> findByNameHome(String name, int page, int limit) {
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
            listFound.add(concession);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return listFound;
}

public int getTotalRecordsByNameHome(String name) {
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
