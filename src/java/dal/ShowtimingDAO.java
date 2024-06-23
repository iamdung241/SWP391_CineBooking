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
        String sql = "select * from Showtime where movie_id = ?";
        List<Showtiming> listShow = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, movieID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int showtime_id = rs.getInt(1);
                String showtime = rs.getString(2);
                int room_id = rs.getInt(3);
                int movie_id = rs.getInt(4);
                String date = rs.getString(5);
                listShow.add(new Showtiming(showtime_id, showtime, room_id, date, movie_id));
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
        String sql = "select * from Showtime s, Room r where showtime_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, showtimeid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int showtimeID = rs.getInt(1);
                String showtimeName = rs.getString(2);
                int roomID = rs.getInt(3);
                int movieID = rs.getInt(4);
                String date = rs.getString(5);
                String roomName = rs.getString(7);
                Showtiming showtime = new Showtiming(showtimeID, showtimeName, roomID,date, movieID, roomName);
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
                Showtiming showtime = new Showtiming(showtimeID, showtimeName, roomID,date, movieID, roomName);
                listShow.add(showtime);
            }
        } catch (SQLException e) {

        }
        return listShow;
    }

    public static void main(String[] args) {
        Showtiming s = new ShowtimingDAO().getShowtimingByShowtimeID(1);
        System.out.println(s.getRoom_name());
    }

}
