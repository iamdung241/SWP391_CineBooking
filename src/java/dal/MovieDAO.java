package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Movie;

/**
 * Data Access Object for Movies. Provides methods to retrieve movies from the
 * database based on search keywords and publication dates. Extends DBContext to
 * use database connection.
 *
 * @Author DungTT
 */
public class MovieDAO extends DBContext {

    /**
     * Retrieves movies matching the given search keyword.
     *
     * @param s the search keyword
     * @return a vector of movies that match the search criteria
     */
    public Vector<Movie> getMoviesByKeywords(String s) {
        String sql = "SELECT * FROM [Movie] WHERE movie_name LIKE ?";
        Vector<Movie> movies = new Vector<>();

        // Use try-with-resources to ensure resources are closed properly
        try (Connection conn = connection; PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, "%" + s + "%");
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    // Retrieve movie details from the result set
                    int movie_id = rs.getInt("movie_id");
                    String movie_name = rs.getString("movie_name");
                    int type_id = rs.getInt("type_id");
                    int duration = rs.getInt("duration");
                    Date date_published = rs.getDate("date_published");
                    String post_img = rs.getString("post_img");
                    String trailer = rs.getString("trailer");
                    String description = rs.getString("description");

                    // Add movie to the list
                    movies.add(new Movie(movie_id, movie_name, type_id, duration, date_published, post_img, trailer, description));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, "Error fetching movies by keywords", ex);
        }

        return movies;
    }

    /**
     * Retrieves movies published before the current date.
     *
     * @return a vector of movies published before today
     */
    public Vector<Movie> getMoviesPublishedBeforeToday() {
        String sql = "SELECT * FROM [Movie] WHERE date_published < GETDATE()";
        Vector<Movie> movies = new Vector<>();

        // Use try-with-resources to ensure resources are closed properly
        try (Connection conn = connection; PreparedStatement stm = conn.prepareStatement(sql)) {
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    // Retrieve movie details from the result set
                    int movie_id = rs.getInt("movie_id");
                    String movie_name = rs.getString("movie_name");
                    int type_id = rs.getInt("type_id");
                    int duration = rs.getInt("duration");
                    Date date_published = rs.getDate("date_published");
                    String post_img = rs.getString("post_img");
                    String trailer = rs.getString("trailer");
                    String description = rs.getString("description");

                    // Add movie to the list
                    movies.add(new Movie(movie_id, movie_name, type_id, duration, date_published, post_img, trailer, description));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, "Error fetching movies published before today", ex);
        }

        return movies;
    }

    /**
     * Retrieves movies published after the current date.
     *
     * @return a vector of movies published after today
     */
    public Vector<Movie> getMoviesPublishedAfterToday() {
        String sql = "SELECT * FROM [Movie] WHERE date_published > GETDATE()";
        Vector<Movie> movies = new Vector<>();

        // Use try-with-resources to ensure resources are closed properly
        try (Connection conn = connection; PreparedStatement stm = conn.prepareStatement(sql)) {
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    // Retrieve movie details from the result set
                    int movie_id = rs.getInt("movie_id");
                    String movie_name = rs.getString("movie_name");
                    int type_id = rs.getInt("type_id");
                    int duration = rs.getInt("duration");
                    Date date_published = rs.getDate("date_published");
                    String post_img = rs.getString("post_img");
                    String trailer = rs.getString("trailer");
                    String description = rs.getString("description");

                    // Add movie to the list
                    movies.add(new Movie(movie_id, movie_name, type_id, duration, date_published, post_img, trailer, description));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, "Error fetching movies published after today", ex);
        }

        return movies;
    }
}
