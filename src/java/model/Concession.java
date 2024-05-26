/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Concession {
    private int concessions_id;
    private String concessions_name;
    private String image;
    private float price;
    private int quality;

    public Concession() {
    }

    public Concession(int concessions_id, String concessions_name, String image, float price, int quality) {
        this.concessions_id = concessions_id;
        this.concessions_name = concessions_name;
        this.image = image;
        this.price = price;
        this.quality = quality;
    }

    public int getConcessions_id() {
        return concessions_id;
    }

    public void setConcessions_id(int concessions_id) {
        this.concessions_id = concessions_id;
    }

    public String getConcessions_name() {
        return concessions_name;
    }

    public void setConcessions_name(String concessions_name) {
        this.concessions_name = concessions_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuality() {
        return quality;
    }

    public void setQuality(int quality) {
        this.quality = quality;
    }
}
