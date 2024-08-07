package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Movie;
import model.Showtiming;
import model.Theater;
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
                + "  FROM [Movie] m join TypeMovie tm on m.type_id = tm.type_id where date_published < GETDATE()";
        List<Movie> movies = new ArrayList<>();

        // Use try-with-resources to ensure resources are closed properly
        try (Connection conn = connection; PreparedStatement stm = conn.prepareStatement(sql)) {
            try (ResultSet rs = stm.executeQuery()) {
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
                + "  FROM [dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where date_published > GETDATE()";
        List<Movie> movies = new ArrayList<>();
        try (Connection conn = connection; PreparedStatement stm = conn.prepareStatement(sql)) {
            try (ResultSet rs = stm.executeQuery()) {
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
                + "  FROM [dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where m.type_id = ?";
        List<Movie> movies = new ArrayList<>();

        // Use try-with-resources to ensure resources are closed properly
        try (Connection conn = connection; PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, type);
            try (ResultSet rs = stm.executeQuery()) {
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
            ResultSet rss = st.executeQuery();
            String movie_name, type_name;
            String post_img, trailer, decription;
            int duration;
            String date_published;
            while (rss.next()) {
                rss.getInt(1);
                movie_name = rss.getString(2);
                duration = rss.getInt(4);
                date_published = rss.getString(5);
                post_img = rss.getString(6);
                trailer = rss.getString(7);
                decription = rss.getString(8);
                type_name = rss.getString(9);
                String movie_validateAge = rss.getString(10);
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
                    + "  FROM [dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id";
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
        try (Connection conn = connection; PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, b);
            try (ResultSet rs = stm.executeQuery()) {
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
                    + "  FROM [dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where m.movie_id = ?";
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
                    + "  FROM [dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where m.type_id = ?";
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
                + "  FROM [dbo].[Movie] m join TypeMovie tm on m.type_id = tm.type_id where movie_name LIKE ?";
        List<Movie> movies = new ArrayList<>();
        String b = "%" + names + "%";

        // Use try-with-resources to ensure resources are closed properly
        try (Connection conn = connection; PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, b);
            try (ResultSet rs = stm.executeQuery()) {
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
        String sql = "SELECT top 4\n"
                + "    m.movie_id, \n"
                + "    m.movie_name, \n"
                + "    m.post_img, \n"
                + "    m.duration, \n"
                + "    m.movie_validateAge, \n"
                + "	m.date_published,\n"
                + "	m.decription,\n"
                + "	m.trailer,\n"
                + "    tm.type_name, \n"
                + "    COUNT(td.ticket_id) AS ticket_count \n"
                + "FROM \n"
                + "    Movie m\n"
                + "    JOIN Showtime s ON m.movie_id = s.movie_id\n"
                + "    JOIN TypeMovie tm ON tm.type_id = m.type_id\n"
                + "    JOIN Ticket_Detail td ON s.showtime_id = td.showtime_id\n"
                + "WHERE \n"
                + "    MONTH(td.date_book) = 6 \n"
                + "    AND YEAR(td.date_book) = YEAR(GETDATE())\n"
                + "GROUP BY \n"
                + "    m.movie_id, \n"
                + "    m.movie_name, \n"
                + "    m.post_img, \n"
                + "    m.duration, \n"
                + "    m.movie_validateAge, \n"
                + "	m.date_published,\n"
                + "	m.decription,\n"
                + "	m.trailer,\n"
                + "    tm.type_name\n"
                + "ORDER BY \n"
                + "    ticket_count DESC";
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
                movie.setType_name(rs.getString(9));
                movie.setDate_published(rs.getString(6));
                movie.setDecription(rs.getString(7));
                movie.setTrailer(rs.getString(8));
                listMovie.add(movie);
            }
        } catch (SQLException e) {

        }
        return listMovie;
    }

    public List<Movie> getMoviesByDate(Date selectedDate) {
        String sql = "SELECT "
                + "    m.movie_id, "
                + "    m.movie_name, "
                + "    m.type_id, "
                + "    tm.type_name, "
                + "    m.duration, "
                + "    m.date_published, "
                + "    m.post_img, "
                + "    m.trailer, "
                + "    m.decription, "
                + "    m.movie_validateAge, "
                + "    m.status "
                + "FROM Movie m "
                + "JOIN TypeMovie tm ON m.type_id = tm.type_id "
                + "JOIN Showtime s ON m.movie_id = s.movie_id "
                + "WHERE CAST(s.date AS DATE) = ?";

        List<Movie> movies = new ArrayList<>();

        try (Connection conn = connection; PreparedStatement stm = conn.prepareStatement(sql)) {

            // Set the selectedDate parameter
            stm.setDate(1, new java.sql.Date(selectedDate.getTime()));

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("movie_id");
                    String movieName = rs.getString("movie_name");
                    int typeId = rs.getInt("type_id");
                    String typeName = rs.getString("type_name");
                    int duration = rs.getInt("duration");
                    String datePublished = rs.getString("date_published");
                    String postImg = rs.getString("post_img");
                    String trailer = rs.getString("trailer");
                    String decription = rs.getString("decription");
                    String age = rs.getString("movie_validateAge");
                    String status = rs.getString("status");

                    movies.add(new Movie(id, movieName, typeId, typeName, duration, datePublished, age, postImg, trailer, decription, status));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, "Error fetching movies for the selected date", ex);
        }

        return movies;
    }

    public List<Movie> getMovieByTheater_DateX(String date) {
        List<Movie> movieList = new ArrayList<>();
        try {
            String sql = "SELECT m.movie_id, m.movie_name, m.type_id, tm.type_name, m.duration, m.date_published, m.post_img, m.trailer, m.decription, m.movie_validateAge, m.status "
                    + "FROM dbo.Movie m "
                    + "JOIN TypeMovie tm ON m.type_id = tm.type_id "
                    + "JOIN showtime s ON m.movie_id = s.movie_id "
                    + "WHERE s.date = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, date);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("movie_id");
                String movieName = rs.getString("movie_name");
                int typeid = rs.getInt("type_id");
                String typeName = rs.getString("type_name");
                int duration = rs.getInt("duration");
                String datePublished = rs.getString("date_published");
                String age = rs.getString("movie_validateAge");
                String postImg = rs.getString("post_img");
                String trailer = rs.getString("trailer");
                String description = rs.getString("decription");
                String status = rs.getString("status");
                List<Showtiming> listShowtime = (new MovieDAO()).getShowtimeByMovieID(id);

                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status, listShowtime);
                movieList.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Use logging instead of printStackTrace in production code
        }
        return movieList;
    }

    public List<Showtiming> getShowtimeByMovieID(int movieID) {
        String sql = "select * from Showtime s join Movie m on m.movie_id = s.movie_id \n"
                + "join Room r on s.room_id = r.room_id\n"
                + "where m.movie_id = ?";
        List<Showtiming> listShow = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, movieID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Showtiming showtime = new Showtiming();
                showtime.setShowtime_id(rs.getInt(1));
                showtime.setShowtiming(rs.getString(2));
                showtime.setDate(rs.getString(5));
                showtime.setRoom_id(rs.getInt(3));
                showtime.setMovie_id(rs.getInt(4));
                showtime.setRoom_name(rs.getString(18));
                listShow.add(showtime);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return listShow;
    }

    public List<Showtiming> getShowtimeByMovieIDandDate(int theaterID, String date) {
        String sql = "SELECT s.showtime_id,s.showtime, s.movie_id, s.room_id, s.theaterID, s.date, r.room_name\n"
                + "FROM Showtime s\n"
                + "JOIN Movie m ON m.movie_id = s.movie_id\n"
                + "JOIN Room r ON s.room_id = r.room_id\n"
                + "WHERE s.theaterID = ? AND s.date =  ?";

        List<Showtiming> listShow = new ArrayList<>();

        try (PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, theaterID);
            st.setString(2, date);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Showtiming showtime = new Showtiming();
                    showtime.setShowtime_id(rs.getInt("showtime_id")); 
                    showtime.setMovie_id(rs.getInt("movie_id"));       
                    showtime.setRoom_id(rs.getInt("room_id"));          
                    showtime.setDate(rs.getString("date"));            
                    showtime.setRoom_name(rs.getString("room_name"));
                    showtime.setShowtiming(rs.getString("showtime"));

                    listShow.add(showtime);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
            // Optionally rethrow or handle the exception based on your application's needs
        }

        return listShow;
    }

    public List<Movie> getMovieByTheater(int theaterID) {
        List<Movie> movieList = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    m.movie_id, \n"
                    + "    m.movie_name, \n"
                    + "    m.type_id, \n"
                    + "    tm.type_name, \n"
                    + "    m.duration, \n"
                    + "    m.date_published, \n"
                    + "    m.post_img, \n"
                    + "    m.trailer, \n"
                    + "    m.decription, \n"
                    + "    m.movie_validateAge, \n"
                    + "    m.status,\n"
                    + "	s.theaterID,\n"
                    + "	t.name\n"
                    + "FROM \n"
                    + "    dbo.Movie m\n"
                    + "JOIN \n"
                    + "    TypeMovie tm ON m.type_id = tm.type_id\n"
                    + "JOIN \n"
                    + "    Showtime s ON m.movie_id = s.movie_id\n"
                    + "	join Theater t on s.theaterID =  t.id\n"
                    + "WHERE \n"
                    + "    s.theaterID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, theaterID);
            rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("movie_id");
                String movieName = rs.getString("movie_name");
                int typeid = rs.getInt("type_id");
                String typeName = rs.getString("type_name");
                int duration = rs.getInt("duration");
                String datePublished = rs.getString("date_published");
                String age = rs.getString("movie_validateAge");
                String postImg = rs.getString("post_img");
                String trailer = rs.getString("trailer");
                String description = rs.getString("decription");
                String status = rs.getString("status");
                int theaterIDx = rs.getInt("theaterID");
                String theaterName = rs.getString("name");
                List<Showtiming> listShowtime = (new MovieDAO()).getShowtimeByMovieID(id);

                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status, listShowtime, theaterIDx, theaterName);

                movieList.add(movie);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return movieList;
    }

    public List<Movie> getMovieByTheaterX(int movieID, int theaterID, String datex) {
        List<Movie> movieList = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    s.date,m.movie_id, \n"
                    + "    m.movie_name, \n"
                    + "    m.type_id, \n"
                    + "    tm.type_name, \n"
                    + "    m.duration, \n"
                    + "    m.date_published, \n"
                    + "    m.post_img, \n"
                    + "    m.trailer, \n"
                    + "    m.decription, \n"
                    + "    m.movie_validateAge, \n"
                    + "    m.status,\n"
                    + "    s.theaterID,\n"
                    + "    t.name AS theater_name\n"
                    + "FROM \n"
                    + "    dbo.Movie m\n"
                    + "JOIN \n"
                    + "    TypeMovie tm ON m.type_id = tm.type_id\n"
                    + "JOIN \n"
                    + "    Showtime s ON m.movie_id = s.movie_id\n"
                    + "JOIN \n"
                    + "    Theater t ON s.theaterID = t.id\n"
                    + "WHERE \n"
                    + "    s.theaterID = ? and s.movie_id = ? and s.date = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, theaterID);
            stm.setInt(2, movieID);
            stm.setString(3, datex);
            rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("movie_id");
                String movieName = rs.getString("movie_name");
                String date = rs.getString("date");
                int typeid = rs.getInt("type_id");
                String typeName = rs.getString("type_name");
                int duration = rs.getInt("duration");
                String datePublished = rs.getString("date_published");
                String age = rs.getString("movie_validateAge");
                String postImg = rs.getString("post_img");
                String trailer = rs.getString("trailer");
                String description = rs.getString("decription");
                String status = rs.getString("status");
                int theaterIDx = rs.getInt("theaterID");
                String theaterName = rs.getString("theater_name");
                List<Showtiming> listShowtime = (new MovieDAO()).getShowtimeByMovieIDandDate(theaterIDx, date);

                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status, listShowtime, theaterIDx, theaterName);

                movieList.add(movie);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return movieList;
    }

    public List<Movie> getMovieByTheaterY(int theaterID, String datex) {
        List<Movie> movieList = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    s.date,m.movie_id, \n"
                    + "    m.movie_name, \n"
                    + "    m.type_id, \n"
                    + "    tm.type_name, \n"
                    + "    m.duration, \n"
                    + "    m.date_published, \n"
                    + "    m.post_img, \n"
                    + "    m.trailer, \n"
                    + "    m.decription, \n"
                    + "    m.movie_validateAge, \n"
                    + "    m.status,\n"
                    + "    s.theaterID,\n"
                    + "    t.name AS theater_name\n"
                    + "FROM \n"
                    + "    dbo.Movie m\n"
                    + "JOIN \n"
                    + "    TypeMovie tm ON m.type_id = tm.type_id\n"
                    + "JOIN \n"
                    + "    Showtime s ON m.movie_id = s.movie_id\n"
                    + "JOIN \n"
                    + "    Theater t ON s.theaterID = t.id\n"
                    + "WHERE \n"
                    + "    s.theaterID = ?  and s.date = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, theaterID);

            stm.setString(2, datex);
            rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("movie_id");
                String movieName = rs.getString("movie_name");
                String date = rs.getString("date");
                int typeid = rs.getInt("type_id");
                String typeName = rs.getString("type_name");
                int duration = rs.getInt("duration");
                String datePublished = rs.getString("date_published");
                String age = rs.getString("movie_validateAge");
                String postImg = rs.getString("post_img");
                String trailer = rs.getString("trailer");
                String description = rs.getString("decription");
                String status = rs.getString("status");
                int theaterIDx = rs.getInt("theaterID");
                String theaterName = rs.getString("theater_name");
                List<Showtiming> listShowtime = (new MovieDAO()).getShowtimeByMovieIDandDate(theaterIDx, date);

                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status, listShowtime, theaterIDx, theaterName);

                movieList.add(movie);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return movieList;
    }

    public List<Movie> getMovieByTheater_Date(int theaterID, String date) {
        List<Movie> movieList = new ArrayList<>();
        try {
            String sql = "SELECT m.movie_id, m.movie_name, m.type_id, tm.type_name, "
                    + "m.duration, m.date_published, m.post_img, m.trailer, m.decription, m.movie_validateAge, m.status "
                    + "FROM dbo.Movie m "
                    + "JOIN TypeMovie tm ON m.type_id = tm.type_id "
                    + "JOIN showtime s ON m.movie_id = s.movie_id "
                    + "WHERE s.theaterID = ? and s.date=?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, theaterID);
            stm.setString(2, date);
            rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("movie_id");
                String movieName = rs.getString("movie_name");
                int typeid = rs.getInt("type_id");
                String typeName = rs.getString("type_name");
                int duration = rs.getInt("duration");
                String datePublished = rs.getString("date_published");
                String age = rs.getString("movie_validateAge");
                String postImg = rs.getString("post_img");
                String trailer = rs.getString("trailer");
                String description = rs.getString("decription");
                String status = rs.getString("status");
                List<Showtiming> listShowtime = (new MovieDAO()).getShowtimeByMovieID(id);

                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status, listShowtime);

                movieList.add(movie);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return movieList;
    }

    public static void main(String[] args) {
        MovieDAO mdao = new MovieDAO();
        //List<Showtiming> list = mdao.getShowtimeByMovieIDandDate(10, 3, "2024-08-03");
        List<Movie> list = mdao.getMovieByTheaterY(1, "2024-08-01");
        for (Movie movie : list) {
            for (Showtiming showtiming : movie.getListShowtime()) {
                System.out.println(showtiming.getShowtiming());
            }
        }

    }

    public List<Movie> getMovieByTheaterX() {
        List<Movie> movieList = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    m.movie_id, \n"
                    + "    m.movie_name, \n"
                    + "    m.type_id, \n"
                    + "    tm.type_name, \n"
                    + "    m.duration, \n"
                    + "    m.date_published, \n"
                    + "    m.post_img, \n"
                    + "    m.trailer, \n"
                    + "    m.decription, \n"
                    + "    m.movie_validateAge, \n"
                    + "    m.status,\n"
                    + "	s.theaterID,\n"
                    + "	t.name\n"
                    + "FROM \n"
                    + "    dbo.Movie m\n"
                    + "JOIN \n"
                    + "    TypeMovie tm ON m.type_id = tm.type_id\n"
                    + "JOIN \n"
                    + "    Showtime s ON m.movie_id = s.movie_id\n"
                    + "	join Theater t on s.theaterID =  t.id\n";

            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("movie_id");
                String movieName = rs.getString("movie_name");
                int typeid = rs.getInt("type_id");
                String typeName = rs.getString("type_name");
                int duration = rs.getInt("duration");
                String datePublished = rs.getString("date_published");
                String age = rs.getString("movie_validateAge");
                String postImg = rs.getString("post_img");
                String trailer = rs.getString("trailer");
                String description = rs.getString("decription");
                String status = rs.getString("status");
                int theaterIDx = rs.getInt("theaterID");
                String theaterName = rs.getString("name");
                List<Showtiming> listShowtime = (new MovieDAO()).getShowtimeByMovieID(id);
                List<Theater> listTheater = (new TheaterDAO().getTheaterByMovie(id));

                Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status, listShowtime, theaterIDx, theaterName, listTheater);

                movieList.add(movie);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return movieList;
    }

}
