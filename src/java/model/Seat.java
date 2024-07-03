/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thanh
 */
public class Seat {
    private int seat_id;
    private String seat_name;
    private float price;
    private int room_id;
    private String status;

    public Seat(int seat_id, String seat_name, float price, int room_id) {
        this.seat_id = seat_id;
        this.seat_name = seat_name;
        this.price = price;
        this.room_id = room_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    
    public Seat(int seat_id, String seat_name, float price, String status) {
        this.seat_id = seat_id;
        this.seat_name = seat_name;
        this.price = price;
        this.status = status;
    }

    public Seat() {
    }

    public int getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(int seat_id) {
        this.seat_id = seat_id;
    }

    public String getSeat_name() {
        return seat_name;
    }

    public void setSeat_name(String seat_name) {
        this.seat_name = seat_name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Seat{" + "seat_id=" + seat_id + ", seat_name=" + seat_name + ", price=" + price + ", room_id=" + room_id + ", status=" + status + '}';
    }

}