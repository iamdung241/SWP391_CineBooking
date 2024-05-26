package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Movie;
import model.TypeMovie;

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
    
    public List<Movie> getAllMovies() {
        List<Movie> listMovie = new ArrayList<>();
        String sql = "SELECT m.*, tm.type_name FROM Movie m, TypeMovie tm \n"
                + "WHERE m.type_id = tm.type_id";
        try {
            Movie movie;
            TypeMovie type_movie;
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int movie_id = rs.getInt(1);
                String movie_name = rs.getString(2);
                int type_id = rs.getInt(3);
                int duration = rs.getInt(4);
                Date date_published = rs.getDate(5);
                String post_img = rs.getString(6);
                String trailer = rs.getString(7);
                String decription = rs.getString(8);
                String type_name = rs.getString(9);
                type_movie = new TypeMovie(type_id, type_name);
                movie = new Movie(movie_id, movie_name, type_id, duration, date_published, post_img, trailer, decription, type_movie);
                listMovie.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listMovie;
    }

    public Movie getMovieById(int movie_id) {
        String sql = "SELECT m.*, tm.type_name FROM Movie m, TypeMovie tm \n"
                + "WHERE m.type_id = tm.type_id AND movie_id = ?";
        try {
            Movie movie;
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, movie_id);
            ResultSet rs = st.executeQuery();
            String movie_name, type_name;
            String post_img, trailer, decription;
            int id, type_id, duration;
            Date date_published;
            while (rs.next()) {
                id = rs.getInt(1);
                movie_name = rs.getString(2);
                type_id = rs.getInt(3);
                duration = rs.getInt(4);
                date_published = rs.getDate(5);
                post_img = rs.getString(6);
                trailer = rs.getString(7);
                decription = rs.getString(8);
                type_name = rs.getString(9);
                TypeMovie type_movie = new TypeMovie(type_id, type_name);
                movie = new Movie(movie_id, movie_name, type_id, duration, date_published, post_img, trailer, decription, type_movie);
                return movie;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
