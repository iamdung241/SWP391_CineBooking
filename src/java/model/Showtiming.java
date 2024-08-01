/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author thanh
 */
public class Showtiming {
    private int showtime_id;
    private String showtiming;
    private int room_id;
    private String date;
    private int movie_id;
    private String room_name;
    private String movie_name;
    private String movieImage;
    private String movieAge;
    private int theaterID;
    private String theaterName;

    public int getTheaterID() {
        return theaterID;
    }

    public void setTheaterID(int theaterID) {
        this.theaterID = theaterID;
    }

    public Showtiming(String showtiming, int room_id, String room_name, int theaterID, String theaterName) {
        this.showtiming = showtiming;
        this.room_id = room_id;
        this.room_name = room_name;
        this.theaterID = theaterID;
        this.theaterName = theaterName;
    }

    

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }
    

    public Showtiming(int showtime_id, String showtiming, int room_id, String date, int movie_id) {
        this.showtime_id = showtime_id;
        this.showtiming = showtiming;
        this.room_id = room_id;
        this.date = date;
        this.movie_id = movie_id;
    }

    public Showtiming(int showtime_id, String showtiming) {
        this.showtime_id = showtime_id;
        this.showtiming = showtiming;
    }

    public Showtiming(int showtime_id, String showtiming, int room_id, String date, int movie_id, String room_name) {
        this.showtime_id = showtime_id;
        this.showtiming = showtiming;
        this.room_id = room_id;
        this.date = date;
        this.movie_id = movie_id;
        this.room_name = room_name;
    }

    public Showtiming(String showtiming, int room_id, String date, int movie_id, int theaterID) {
        this.showtiming = showtiming;
        this.room_id = room_id;
        this.date = date;
        this.movie_id = movie_id;
        this.theaterID = theaterID;
    }

    public Showtiming(String showtiming, int room_id, String date, int movie_id) {
        this.showtiming = showtiming;
        this.room_id = room_id;
        this.date = date;
        this.movie_id = movie_id;
    }

    public Showtiming() {
    }

    public String getMovieAge() {
        return movieAge;
    }

    public void setMovieAge(String movieAge) {
        this.movieAge = movieAge;
    }

    public int getShowtime_id() {
        return showtime_id;
    }

    public void setShowtime_id(int showtime_id) {
        this.showtime_id = showtime_id;
    }

    public String getShowtiming() {
        return showtiming;
    }

    public void setShowtiming(String showtiming) {
        this.showtiming = showtiming;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getMovie_name() {
        return movie_name;
    }

    public void setMovie_name(String movie_name) {
        this.movie_name = movie_name;
    }

    public String getMovieImage() {
        return movieImage;
    }

    public void setMovieImage(String movieImage) {
        this.movieImage = movieImage;
    }

}
