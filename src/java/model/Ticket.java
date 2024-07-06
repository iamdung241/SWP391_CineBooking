/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author tranh
 */
public class Ticket {
    private int id;
    private String code;
    private int accountId;
    private int showtimeId;
    private List<Seat> seat;
    private int totalprice;
    private List<Concession> combo;
    private String status;
    private String date_book;
    private Showtiming showtime;
    private String movieName;
    private String movieImage;

    public Ticket() {
    }

    public Ticket(int id, String code, int accountId, int showtimeId, List<Seat> seat, int totalprice, List<Concession> combo, String status, String date_book) {
        this.id = id;
        this.code = code;
        this.accountId = accountId;
        this.showtimeId = showtimeId;
        this.seat = seat;
        this.totalprice = totalprice;
        this.combo = combo;
        this.status = status;
        this.date_book = date_book;
    }

    public Ticket(String code, int accountId, int showtimeId, List<Seat> seat, int totalprice, List<Concession> combo, String status, String date_book) {
        this.code = code;
        this.accountId = accountId;
        this.showtimeId = showtimeId;
        this.seat = seat;
        this.totalprice = totalprice;
        this.combo = combo;
        this.status = status;
        this.date_book = date_book;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public List<Seat> getSeat() {
        return seat;
    }
    
    public String getSeatToString(List<Seat> s){
        String a = "";
        for (Seat s1 : s) {
            a+= s1.getSeat_name()+" ";
        }
        return a;
    }

    public void setSeat(List<Seat> seat) {
        this.seat = seat;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(int totalprice) {
        this.totalprice = totalprice;
    }

    public List<Concession> getCombo() {
        return combo;
    }
    
    public String getComboToString(List<Concession> c){
        String a = "";
        for (Concession c1 : c) {
            a += c1.getConcessions_name() + "-Sl:" + c1.getQuantity() + " ";
        }
        return a;
    }

    public void setCombo(List<Concession> combo) {
        this.combo = combo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate_book() {
        return date_book;
    }

    public void setDate_book(String date_book) {
        this.date_book = date_book;
    }

    public Showtiming getShowtime() {
        return showtime;
    }

    public void setShowtime(Showtiming showtime) {
        this.showtime = showtime;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieImage() {
        return movieImage;
    }

    public void setMovieImage(String movieImage) {
        this.movieImage = movieImage;
    }
    
    
    @Override
    public String toString() {
        return "Ticket{" + "id=" + id + ", code=" + code + ", accountId=" + accountId + ", showtimeId=" + showtimeId + ", seat=" + seat + ", totalprice=" + totalprice + ", combo=" + combo + ", status=" + status + ", date_book=" + date_book + '}';
    }

    
}
