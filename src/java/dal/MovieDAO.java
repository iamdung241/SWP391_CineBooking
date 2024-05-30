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

    PreparedStatement stm;
    ResultSet rs;

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
                    String date_published = rs.getString("date_published");
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
                    String date_published = rs.getString("date_published");
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
                    String date_published = rs.getString("date_published");
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
                String date_published = rs.getString(5);
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
            String date_published;
            while (rs.next()) {
                id = rs.getInt(1);
                movie_name = rs.getString(2);
                type_id = rs.getInt(3);
                duration = rs.getInt(4);
                date_published = rs.getString(5);
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

    //HuyTQ
    public List<Movie> getMovie() {
        List<Movie> data = new ArrayList<>();
        try {
            String sql = "SELECT [movie_id]\n"
                    + "      ,[movie_name]\n"
                    + "      ,m.[type_id]\n"
                    + ",tm.type_name\n"
                    + "      ,[duration]\n"
                    + "      ,[date_published]\n"
                    + "      ,[post_img]\n"
                    + "      ,[trailer]\n"
                    + "      ,[decription]\n"
                    + "      ,[movie_validateAge]\n"
                    + "      ,[status]\n"
                    + "  FROM [CineBooking].[dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String movieName = rs.getString(2);
                int typeid = rs.getInt(3);
                String typeName = rs.getString(4);
                int duration = rs.getInt(5);
                String datePublished = rs.getString(6);
                String postImg = rs.getString(7);
                String trailer = rs.getString(8);
                String description = rs.getString(9);
                String age = rs.getString(10);
                String statu = rs.getString(11);
                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, statu);
                data.add(movie);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return data;
    }

    public Movie getMovieByID(int idmo) {
        try {
            String sql = "SELECT [movie_id]\n"
                    + "      ,[movie_name]\n"
                    + "      ,m.[type_id]\n"
                    + ",tm.type_name\n"
                    + "      ,[duration]\n"
                    + "      ,[date_published]\n"
                    + "      ,[post_img]\n"
                    + "      ,[trailer]\n"
                    + "      ,[decription]\n"
                    + "      ,[movie_validateAge]\n"
                    + "      ,[status]\n"
                    + "  FROM [CineBooking].[dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where m.movie_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, idmo);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String movieName = rs.getString(2);
                int typeid = rs.getInt(3);
                String typeName = rs.getString(4);
                int duration = rs.getInt(5);
                String datePublished = rs.getString(6);
                String age = rs.getString(10);
                String postImg = rs.getString(7);
                String trailer = rs.getString(8);
                String description = rs.getString(9);
                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished,age, postImg, trailer, description);
                return movie;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public void addNewMovie(Movie movie) {
        try {
            String sql = "INSERT INTO [dbo].[Movie]\n"
                    + "           ([movie_name]\n"
                    + "           ,[type_id]\n"
                    + "           ,[duration]\n"
                    + "           ,[date_published]\n"
                    + "           ,[post_img]\n"
                    + "           ,[trailer]\n"
                    + "           ,[decription]\n"
                    + "           ,[movie_validateAge])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, movie.getMovie_name());
            stm.setInt(2, movie.getType_id());
            stm.setInt(3, movie.getDuration());
            stm.setString(4, movie.getDate_published());
            stm.setString(5, movie.getPost_img());
            stm.setString(6, movie.getTrailer());
            stm.setString(7, movie.getDecription());
            stm.setString(8, movie.getAge());
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public void updateMovie(Movie movie) {
        try {
            String sql = "UPDATE [dbo].[Movie]\n"
                    + "   SET [movie_name] = ?\n"
                    + "      ,[type_id] = ?\n"
                    + "      ,[duration] = ?\n"
                    + "      ,[date_published] = ?\n"
                    + "      ,[post_img] = ?\n"
                    + "      ,[trailer] = ?\n"
                    + "      ,[decription] = ?\n"
                    + "      ,[movie_validateAge] = ?\n"
                    + " WHERE movie_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, movie.getMovie_name());
            stm.setInt(2, movie.getType_id());
            stm.setInt(3, movie.getDuration());
            stm.setString(4, movie.getDate_published());
            stm.setString(5, movie.getPost_img());
            stm.setString(6, movie.getTrailer());
            stm.setString(7, movie.getDecription());
            stm.setString(8, movie.getAge());
            stm.setInt(9, movie.getMovie_id());
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public void DeleteMovie(int idMovie) {
        String off = "off";
        try {
            String sql = "UPDATE [dbo].[Movie]\n"
                    + "   SET \n"
                    + "      [status] = ?\n"
                    + " WHERE movie_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, off);
            stm.setInt(2, idMovie);
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public List<TypeMovie> getTypeMovie() {
        List<TypeMovie> data = new ArrayList<>();
        try {
            String sql = "SELECT [type_id]\n"
                    + "      ,[type_name]\n"
                    + "  FROM [dbo].[TypeMovie]";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                TypeMovie t1 = new TypeMovie(id, name);
                data.add(t1);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return data;
    }

    public static void main(String[] args) {
        List<Movie> data = new MovieDAO().getMovie();
        for (Movie movie : data) {
            System.out.println(movie.toString());
        }
    }
}
