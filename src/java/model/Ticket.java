/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tranh
 */
public class Ticket {
    private String code;
    private int showtimeId;
    private String seat;
    private int totalprice;
    private String combo;
    private String payment;
    private String status;
    private String date_book;
    private String showtime;

    public Ticket(int showtimeId, String seat, int totalprice, String combo, String payment, String status) {
        this.showtimeId = showtimeId;
        this.seat = seat;
        this.totalprice = totalprice;
        this.combo = combo;
        this.payment = payment;
        this.status = status;
    }

    
    
    public Ticket(String code, String seat, int totalprice, String combo, String payment, String status, String date_book, String showtime) {
        this.code = code;
        this.seat = seat;
        this.totalprice = totalprice;
        this.combo = combo;
        this.payment = payment;
        this.status = status;
        this.date_book = date_book;
        this.showtime = showtime;
    }

    public Ticket() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(int totalprice) {
        this.totalprice = totalprice;
    }

    public String getCombo() {
        return combo;
    }

    public void setCombo(String combo) {
        this.combo = combo;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
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

    public String getShowtime() {
        return showtime;
    }

    public void setShowtime(String showtime) {
        this.showtime = showtime;
    }
    
    @Override
    public String toString() {
        return "Ticket{" + "showtime=" + showtime + ", seat=" + seat + ", totalprice=" + totalprice + ", combo=" + combo + ", payment=" + payment + ", status=" + status + '}';
    }
    
}
