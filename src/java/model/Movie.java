/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DungTT
 */

import java.util.Date;

public class Movie {
    private int movie_id;
    private String movie_name;
    private int type_id;
    private int duration;
    private Date date_published;
    private String post_img, trailer, decription;

    public Movie() {
    }

    public Movie(int movie_id, String movie_name, int type_id, int duration, Date date_published, String post_img, String trailer, String decription) {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.type_id = type_id;
        this.duration = duration;
        this.date_published = date_published;
        this.post_img = post_img;
        this.trailer = trailer;
        this.decription = decription;
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

    public Date getDate_published() {
        return date_published;
    }

    public void setDate_published(Date date_published) {
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
    
    
}
