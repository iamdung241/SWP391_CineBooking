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
        String sql = "SELECT * FROM Concessions";

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

    /**
     * Searches for concession items in the database based on a keyword.
     *
     * @param keyword the keyword to search for in concession names, images,
     * prices, and quantities
     * @return a list of concession items matching the keyword
     */
    public List<Concession> findByKeyword(String keyword) {
        List<Concession> concessions = new ArrayList<>();
        String sql = "SELECT * FROM Concessions WHERE concessions_name LIKE ? OR image LIKE ? OR CAST(price AS CHAR) LIKE ? OR CAST(quantity AS CHAR) LIKE ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            String queryKeyword = "%" + keyword + "%";
            statement.setString(1, queryKeyword);
            statement.setString(2, queryKeyword);
            statement.setString(3, queryKeyword);
            statement.setString(4, queryKeyword);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Concession concession = new Concession();
                concession.setConcessions_id(resultSet.getInt("concessions_id"));
                concession.setConcessions_name(resultSet.getString("concessions_name"));
                concession.setImage(resultSet.getString("image"));
                concession.setPrice(resultSet.getFloat("price"));
                concession.setQuantity(resultSet.getInt("quantity"));
                concessions.add(concession);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return concessions;
    }

    public void deleteConcession(int id) {
        String sql = "UPDATE Concessions SET status = 0 WHERE concessions_id  = ?";

        try {

            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ConcessionDAO concessionDAO = new ConcessionDAO();
        List<Concession> listFound = concessionDAO.findByKeyword("6");

        for (Concession concession : listFound) {
            System.out.println(concession.toString());
        }
    }

}

