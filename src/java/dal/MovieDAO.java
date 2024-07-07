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
import model.Showtiming;
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

    public List<Movie> getMoviesPublishedBeforeToday() {
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
                + "  FROM [CineBooking].[dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where date_published < GETDATE()";
        List<Movie> movies = new ArrayList<>();

        // Use try-with-resources to ensure resources are closed properly
        try ( Connection conn = connection;  PreparedStatement stm = conn.prepareStatement(sql)) {
            try ( ResultSet rs = stm.executeQuery()) {
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
                    String status = rs.getString(11);
                    movies.add(new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status));
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
    public List<Movie> getMoviesPublishedAfterToday() {
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
                + "  FROM [CineBooking].[dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where date_published > GETDATE()";
        List<Movie> movies = new ArrayList<>();
        try ( Connection conn = connection;  PreparedStatement stm = conn.prepareStatement(sql)) {
            try ( ResultSet rs = stm.executeQuery()) {
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
                    String status = rs.getString(11);
                    movies.add(new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, "Error fetching movies published before today", ex);
        }

        return movies;
    }

    public List<Movie> getMoviesByType(int type) {
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
                + "  FROM [CineBooking].[dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where m.type_id = ?";
        List<Movie> movies = new ArrayList<>();

        // Use try-with-resources to ensure resources are closed properly
        try ( Connection conn = connection;  PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, type);
            try ( ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    // Retrieve movie details from the result set
                    int movie_id = rs.getInt("movie_id");
                    String movie_name = rs.getString("movie_name");
                    int type_id = rs.getInt("type_id");
                    String typeName = rs.getString(4);
                    int duration = rs.getInt("duration");
                    String date_published = rs.getString("date_published");
                    String age = rs.getString("movie_validateAge");
                    String post_img = rs.getString("post_img");
                    String trailer = rs.getString("trailer");
                    String decription = rs.getString("decription");
                    String type_name = rs.getString("type_name");
                    String status = rs.getString("status");
                    //TypeMovie type_movie = new TypeMovie(type_id, type_name);

                    // Add movie to the list
                    movies.add(new Movie(movie_id, movie_name, type_id, type_name, duration, date_published, age, post_img, trailer, decription, status));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, "Error fetching movies by keywords", ex);
        }

        return movies;
    }

    public List<Movie> getAllMovies() {
        List<Movie> listMovie = new ArrayList<>();
        String sql = "SELECT m.movie_id, m.movie_name, m.type_id, m.duration, m.date_published, m.post_img, m.trailer, m.decription, tm.type_name, movie_validateAge FROM Movie m, TypeMovie tm \n"
                + "                  WHERE m.type_id = tm.type_id";
        try {
            Movie movie;
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
                String movie_validateAge = rs.getString(10);
                movie = new Movie(movie_id, movie_name, type_id, type_name, duration, date_published, movie_validateAge, post_img, trailer, decription);
                listMovie.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listMovie;
    }

    //author: thanhbtm
    public Movie getMovieById(int movie_id) {
        String sql = "SELECT m.movie_id, m.movie_name, m.type_id, m.duration, m.date_published, m.post_img, m.trailer, m.decription, tm.type_name, m.movie_validateAge FROM Movie m, TypeMovie tm \n"
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
                duration = rs.getInt(4);
                date_published = rs.getString(5);
                post_img = rs.getString(6);
                trailer = rs.getString(7);
                decription = rs.getString(8);
                type_name = rs.getString(9);
                String movie_validateAge = rs.getString(10);
                movie = new Movie(movie_id, movie_name, type_name, duration, date_published, post_img, trailer, decription, movie_validateAge);
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

    public List<Movie> getMoviesBySearch(String names) {
        String sql = "SELECT m.*, tm.type_name FROM Movie m, TypeMovie tm WHERE m.type_id = tm.type_id AND movie_name LIKE ?";
        List<Movie> movies = new ArrayList<>();
        String b = "%" + names + "%";
        // Use try-with-resources to ensure resources are closed properly
        try ( Connection conn = connection;  PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, b);
            try ( ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    // Retrieve movie details from the result set
                    int movie_id = rs.getInt("movie_id");
                    String movie_name = rs.getString("movie_name");
                    int type_id = rs.getInt("type_id");
                    int duration = rs.getInt("duration");
                    String date_published = rs.getString("date_published");
                    String age = rs.getString("movie_validateAge");
                    String post_img = rs.getString("post_img");
                    String trailer = rs.getString("trailer");
                    String decription = rs.getString("decription");
                    String type_name = rs.getString("type_name");
                    String status = rs.getString("status");
                    // Add movie to the list
                    movies.add(new Movie(movie_id, movie_name, type_id, type_name, duration, date_published, age, post_img, trailer, decription, status));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, "Error fetching movies by keywords", ex);
        }

        return movies;
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
                String status = rs.getString(11);
                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status);
                return movie;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public List<Movie> getMovieByType(int typeId) {
        List<Movie> movies = new ArrayList<>();
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
                    + "  FROM [CineBooking].[dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where m.type_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, typeId);
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
                String status = rs.getString(11);
                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status);
                movies.add(movie);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return movies;
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

    public Movie getMovieWithListShowtiming(List<Showtiming> listshow) {
        ShowtimingDAO showdao = new ShowtimingDAO();
        String sql = "select * from Showtime s, Movie m where s.movie_id = m.movie_id";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int movie_id = rs.getInt(4);
                String movie_name = rs.getString(7);
                int duration = rs.getInt(9);
                String post_img = rs.getString(11);
                listshow = showdao.getShowtimingByRoomID(movie_id);
                Movie movie = new Movie(movie_id, movie_name, duration, post_img, listshow);
                return movie;
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }

    public List<Movie> getMoviesByKeywords(String names) {
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
                + "  FROM [CineBooking].[dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where movie_name LIKE ?";
        List<Movie> movies = new ArrayList<>();
        String b = "%" + names + "%";

        // Use try-with-resources to ensure resources are closed properly
        try ( Connection conn = connection;  PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, b);
            try ( ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    // Retrieve movie details from the result set
                    int movie_id = rs.getInt("movie_id");
                    String movie_name = rs.getString("movie_name");
                    int type_id = rs.getInt("type_id");
                    String typeName = rs.getString(4);
                    int duration = rs.getInt("duration");
                    String date_published = rs.getString("date_published");
                    String age = rs.getString("movie_validateAge");
                    String post_img = rs.getString("post_img");
                    String trailer = rs.getString("trailer");
                    String decription = rs.getString("decription");
                    String type_name = rs.getString("type_name");
                    //TypeMovie type_movie = new TypeMovie(type_id, type_name);

                    // Add movie to the list
                    movies.add(new Movie(movie_id, movie_name, type_id, type_name, duration, date_published, age, post_img, trailer, decription));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, "Error fetching movies by keywords", ex);
        }

        return movies;
    }

    public int getMovieIdByMovieName(String movieName) {
        int movieId = -1;
        String sql = "select movie_id from Movie where movie_name = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, movieName);
            rs = stm.executeQuery();
            if (rs.next()) {
                movieId = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return movieId;
    }

    public List<Movie> getTopMovieForMonth() {
        List<Movie> listMovie = new ArrayList();
        String sql = "select TOP(4) m.movie_id, m.movie_name, m.post_img, m.duration, m.movie_validateAge, tm.type_name, COUNT(td.ticket_id) as ticket_count from Movie m \n"
                + "join Showtime s on m.movie_id = s.movie_id\n"
                + "join TypeMovie tm on tm.type_id = m.type_id\n"
                + "join Ticket_Detail td on s.showtime_id = td.showtime_id\n"
                + "WHERE MONTH(td.date_book) = MONTH(GETDATE()) AND YEAR(td.date_book) = YEAR(GETDATE())\n"
                + "GROUP BY m.movie_id, m.movie_name, m.post_img, m.duration, m.movie_validateAge, tm.type_name\n"
                + "ORDER BY ticket_count DESC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setMovie_id(rs.getInt(1));
                movie.setMovie_name(rs.getString(2));
                movie.setPost_img(rs.getString(3));
                movie.setDuration(rs.getInt(4));
                movie.setAge(rs.getString(5));
                movie.setType_name(rs.getString(6));
                listMovie.add(movie);
            }
        } catch (SQLException e) {

        }
        return listMovie;
    }

    public static void main(String[] args) {
        MovieDAO mdao = new MovieDAO();
        List<Movie> list = mdao.getTopMovieForMonth();
        for (Movie movie : list) {
            System.out.println(movie.getMovie_name());
        }
    }
}
