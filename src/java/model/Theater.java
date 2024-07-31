/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Theater {
    private int id;
    private String name;
    private int movie_id;
    private String movie_name;
    private int type_id;
    private String type_name;
    private int duration;
    private String date_published, age;
    private String post_img, trailer, decription, status;
    private List<Showtiming> listShowtime;
    private TypeMovie type_movie;

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

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
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

    public void setDate_published(String date_published) {
        this.date_published = date_published;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Showtiming> getListShowtime() {
        return listShowtime;
    }

    public void setListShowtime(List<Showtiming> listShowtime) {
        this.listShowtime = listShowtime;
    }

    public TypeMovie getType_movie() {
        return type_movie;
    }

    public void setType_movie(TypeMovie type_movie) {
        this.type_movie = type_movie;
    }


    public Theater() {
    }

    public Theater(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public Theater(int movie_id, String movie_name, int type_id, String type_name, int duration, String date_published, String age, String post_img, String trailer, String decription,
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
        this.id = theaterID;
        this.name = theaterName;
    }

    
}
