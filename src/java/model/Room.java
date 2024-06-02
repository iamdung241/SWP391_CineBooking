/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thanh
 */
public class Room {
    private int room_id;
    private String room_name;
    private int showtime_id;

    public Room(int room_id, String room_name) {
        this.room_id = room_id;
        this.room_name = room_name;
    }

    public Room(int room_id, String room_name, int showtime_id) {
        this.room_id = room_id;
        this.room_name = room_name;
        this.showtime_id = showtime_id;
    }
    
    

    public Room(int room_id) {
        this.room_id = room_id;
    }

    public Room() {
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

    public int getShowtime_id() {
        return showtime_id;
    }

    public void setShowtime_id(int showtime_id) {
        this.showtime_id = showtime_id;
    }
    
}
