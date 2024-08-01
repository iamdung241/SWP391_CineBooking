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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Movie;
import model.Showtiming;

/**
 *
 * @author thanh
 */
public class ShowtimingDAO extends DBContext {

    public List<Showtiming> getAllShowtime() {
        String sql = "SELECT showtime_id, showtime_name FROM Showtiming";
        List<Showtiming> listShowtime = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int showtime_id = rs.getInt(1);
                String showtiming = rs.getString(2);
                Showtiming time = new Showtiming(showtime_id, showtiming);
                listShowtime.add(time);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listShowtime;
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

    public List<Movie> getMovieWithShowtime() {
        String sql = "select * from Movie m\n"
                + "join TypeMovie tm on m.type_id = tm.type_id";
        List<Movie> listMovie = new ArrayList();
        ShowtimingDAO sdao = new ShowtimingDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int movie_id = rs.getInt(1);
                String movie_name = rs.getString(2);
                int duration = rs.getInt(4);
                String post_img = rs.getString(6);
                String type_name = rs.getString(12);
                List<Showtiming> listShow = sdao.getShowtimeByMovieID(movie_id);
                listMovie.add(new Movie(movie_id, movie_name, type_name, duration, post_img, listShow));
            }
        } catch (SQLException e) {

        }
        return listMovie;
    }

    public Showtiming getShowtimingByShowtimeID(int showtimeid) {
        String sql = "SELECT *\n"
                + "FROM Showtime s\n"
                + "JOIN Room r ON s.room_id = r.room_id\n"
                + "JOIN Movie m ON m.movie_id = s.movie_id\n"
                + "join Theater t on t.id = s.theaterID\n"
                + "WHERE s.showtime_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, showtimeid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Showtiming showtime = new Showtiming();
                showtime.setShowtime_id(rs.getInt(1));
                showtime.setShowtiming(rs.getString(2));
                showtime.setRoom_id(rs.getInt(3));
                showtime.setRoom_name(rs.getString(8));
                showtime.setMovie_id(rs.getInt(9));
                showtime.setMovie_name(rs.getString(10));
                showtime.setDate(rs.getString(6));
                showtime.setTheaterName(rs.getString(20));
                return showtime;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<Showtiming> getShowtimingByRoomID(int roomid) {
        String sql = "select * from Showtime s, Room r where room_id = ?";
        List<Showtiming> listShow = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int showtimeID = rs.getInt(1);
                String showtimeName = rs.getString(2);
                int roomID = rs.getInt(3);
                int movieID = rs.getInt(4);
                String date = rs.getString(5);
                String roomName = rs.getString(7);
                Showtiming showtime = new Showtiming(showtimeID, showtimeName, roomID, date, movieID, roomName);
                listShow.add(showtime);
            }
        } catch (SQLException e) {

        }
        return listShow;
    }

    public List<Showtiming> getListShowtiming() {
        List<Showtiming> listShowtime = new ArrayList();
        String sql = "select * from showtime s\n"
                + "join movie m on m.movie_id = s.movie_id\n"
                + "join room r on r.room_id = s.room_id ORDER BY s.date DESC, s.showtime";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Showtiming showtime = new Showtiming();
                showtime.setShowtime_id(rs.getInt(1));
                showtime.setShowtiming(rs.getString(2));
                showtime.setRoom_id(rs.getInt(3));
                showtime.setMovie_id(rs.getInt(4));
                showtime.setDate(rs.getString(6));
                showtime.setMovie_name(rs.getString(8));
                showtime.setMovieImage(rs.getString(12));
                showtime.setRoom_name(rs.getString(18));
                listShowtime.add(showtime);
            }
        } catch (SQLException e) {

        }
        return listShowtime;
    }

    public boolean checkShowtimeExists(String date, String showtime, int roomId) {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM Showtime WHERE date = ? AND showtime = ? AND room_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setString(2, showtime);
            st.setInt(3, roomId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) > 0) {
                    exists = true;
                }
            }
        } catch (SQLException e) {

        }

        return exists;
    }

    public void addShowtime(Showtiming showtime) {
        String sql = "INSERT INTO dbo.[Showtime] ([showtime], [room_id], [movie_id], [date], [theaterID]) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, showtime.getShowtiming());
            st.setInt(2, showtime.getRoom_id());
            st.setInt(3, showtime.getMovie_id());
            st.setString(4, showtime.getDate());
            st.setInt(5, showtime.getTheaterID());
            st.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public void updateShowtime(Showtiming showtime) {
        String sql = "update dbo.Showtime \n"
                + "set showtime = ?, room_id = ?, date = ?\n"
                + "where showtime_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, showtime.getShowtiming());
            st.setInt(2, showtime.getRoom_id());
            st.setString(3, showtime.getDate());
            st.setInt(4, showtime.getShowtime_id());
            st.executeUpdate();
        } catch (SQLException e) {
            e.getMessage();
        }
    }

    public List<Showtiming> getRoomAndShowtime(int movieID, String date, int theaterID) {
        List<Showtiming> listShowtime = new ArrayList();
        String sql = "SELECT s.showtime_id, t.id,t.name, s.showtime, r.room_id, r.room_name\n"
                + "FROM Showtime s\n"
                + "JOIN Theater t ON s.theaterID = t.id \n"
                + "JOIN Room r on r.room_id = s.room_id\n"
                + "WHERE s.movie_id = ?\n"
                + "  AND CAST(s.date AS DATE) = ?\n"
                + "  and s.theaterID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, movieID);
            stm.setString(2, date);
            stm.setInt(3, theaterID);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int showtimeId = rs.getInt("showtime_id");
                String name = rs.getString("name");
                String showtime = rs.getString("showtime");
                int room_id = rs.getInt("room_id");
                String room_name = rs.getString("room_name");

                Showtiming show = new Showtiming(showtimeId,showtime, room_id, room_name, theaterID, room_name);

                //Movie movie = new Movie(id, movieName, typeid, typeName, duration, datePublished, age, postImg, trailer, description, status, listShowtime, theaterIDx, theaterName);
                listShowtime.add(show);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShowtimingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listShowtime;
    }

    public static void main(String[] args) {
        //Showtiming s = new Showtiming("22", 3, "2024-07-16", 7);
        //Showtiming s = (new ShowtimingDAO()).getRoomAndShowtime(17, "2024-08-01", 4);
        //System.out.println(s.toString());
        List<Showtiming> s = new ShowtimingDAO().getRoomAndShowtime(2, "2024-08-01", 7);
        for (Showtiming showtiming : s) {
            System.out.println(showtiming.getRoom_name());
        }
    }

}
