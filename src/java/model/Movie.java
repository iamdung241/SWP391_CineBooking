/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author DungTT
 */
public class Movie {

    private int movie_id;
    private String movie_name;
    private int type_id;
    private String type_name;
    private int duration;
    private String date_published, age;
    private String post_img, trailer, decription, status;
    private List<Showtiming> listShowtime;
    private TypeMovie type_movie;
    private int theaterID;
    private String theaterName;
    private List<Theater> listTheater;
    
    private int room_id;
    private String room_name;

    public TypeMovie getType_movie() {
        return type_movie;
    }

    public void setType_movie(TypeMovie type_movie) {
        this.type_movie = type_movie;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }
    
    

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }

    public Movie() {
    }

    public Movie(int movie_id, String movie_name, String type_name, int duration, String date_published, String age, String post_img, String trailer, String decription, List<Showtiming> listShowtime) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_name = type_name;
        this.duration = duration;
        this.date_published = date_published;
        this.age = age;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
        this.listShowtime = listShowtime;
    }

    public Movie(int movie_id, String movie_name, String type_name, int duration, String date_published, String post_img, String trailer, String decription, String age) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_name = type_name;
        this.duration = duration;
        this.date_published = date_published;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
        this.age = age;
    }

    public Movie(int movie_id, String movie_name, int type_id, String type_name, int duration, String date_published, String post_img, String trailer, String decription) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_id = type_id;
        this.type_name = type_name;
        this.duration = duration;
        this.date_published = date_published;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
    }

    public Movie(int movie_id, String movie_name, int type_id, int duration, String date_published, String post_img, String trailer, String decription, TypeMovie type_movie) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_id = type_id;
        this.duration = duration;
        this.date_published = date_published;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
        this.type_movie = type_movie;
    }

    public Movie(int movie_id, String movie_name, int type_id, String type_name, int duration, String date_published, String age, String post_img, String trailer, String decription) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_id = type_id;
        this.type_name = type_name;
        this.duration = duration;
        this.date_published = date_published;
        this.age = age;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
    }

    public Movie(int movie_id, String movie_name, int type_id, String type_name, int duration, String date_published, String age, String post_img, String trailer, String decription, String status) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_id = type_id;
        this.type_name = type_name;
        this.duration = duration;
        this.date_published = date_published;
        this.age = age;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
        this.status = status;
    }

    public Movie(int movie_id, String movie_name, int type_id, int duration, String date_published, String post_img, String trailer, String decription) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_id = type_id;
        this.duration = duration;
        this.date_published = date_published;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
    }

    public Movie(int movie_id, String movie_name) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
    }

    public Movie(int movie_id, String movie_name, String type_name, int duration, String post_img, List<Showtiming> listShowtime) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_name = type_name;
        this.duration = duration;
        this.post_img = post_img;
        this.listShowtime = listShowtime;
    }

    public Movie(int movie_id, String movie_name, int duration, String post_img, List<Showtiming> listShowtime) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.duration = duration;
        this.post_img = post_img;
        this.listShowtime = listShowtime;
    }

    public Movie(int movie_id, String movie_name, int type_id, String type_name, int duration, String date_published, String age, String post_img, String trailer, String decription, String status, List<Showtiming> listShowtime) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_id = type_id;
        this.type_name = type_name;
        this.duration = duration;
        this.date_published = date_published;
        this.age = age;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
        this.status = status;
        this.listShowtime = listShowtime;
    }

    public Movie(int movie_id, String movie_name, int type_id, String type_name, int duration, String date_published, String age, String post_img, String trailer, String decription,
            String status, List<Showtiming> listShowtime, int theaterID, String theaterName, List<Theater> listTheater) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_id = type_id;
        this.type_name = type_name;
        this.duration = duration;
        this.date_published = date_published;
        this.age = age;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
        this.status = status;
        this.listShowtime = listShowtime;
        this.theaterID = theaterID;
        this.theaterName = theaterName;
        this.listTheater = listTheater;
    }
    
    public Movie(int movie_id, String movie_name, int type_id, String type_name, int duration, String date_published, String age, String post_img, String trailer, String decription,
            String status, List<Showtiming> listShowtime, int theaterID, String theaterName) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_id = type_id;
        this.type_name = type_name;
        this.duration = duration;
        this.date_published = date_published;
        this.age = age;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
        this.status = status;
        this.listShowtime = listShowtime;
        this.theaterID = theaterID;
        this.theaterName = theaterName;
    }

    public List<Theater> getListTheater() {
        return listTheater;
    }

    public void setListTheater(List<Theater> listTheater) {
        this.listTheater = listTheater;
    }

    public Movie(int movie_id) {
        this.movie_id = movie_id;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getMovie_name() {
        return movie_name;
    }

    public void setMovie_name(String movie_name) {
        this.movie_name = movie_name;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getDate_published() {
        return date_published;
    }

    public int getTheaterID() {
        return theaterID;
    }

    public void setTheaterID(int theaterID) {
        this.theaterID = theaterID;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setDate_published(String date_published) {
        this.date_published = date_published;
    }

    public String getPost_img() {
        return post_img;
    }

    public void setPost_img(String post_img) {
        this.post_img = post_img;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getDecription() {
        return decription;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }

    public List<Showtiming> getListShowtime() {
        return listShowtime;
    }

    public void setListShowtime(List<Showtiming> listShowtime) {
        this.listShowtime = listShowtime;
    }

}
