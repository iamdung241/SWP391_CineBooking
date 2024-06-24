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
    private int id;
    private int showtime;
    private String seat;
    private int totalprice;
    private String combo;
    private String payment;
    private String status;
    private String code;
    private String date;
    private int accountId;

    public Ticket() {
    }

    public Ticket(int showtime, String seat, int totalprice, String combo, String payment, String status, String code, String date) {
        this.showtime = showtime;
        this.seat = seat;
        this.totalprice = totalprice;
        this.combo = combo;
        this.payment = payment;
        this.status = status;
        this.code = code;
        this.date = date;
    }

    public Ticket(int id, int showtime, String seat, int totalprice, String combo, String payment, String status, String code, String date, int accountId) {
        this.id = id;
        this.showtime = showtime;
        this.seat = seat;
        this.totalprice = totalprice;
        this.combo = combo;
        this.payment = payment;
        this.status = status;
        this.code = code;
        this.date = date;
        this.accountId = accountId;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getShowtime() {
        return showtime;
    }

    public void setShowtime(int showtime) {
        this.showtime = showtime;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Ticket{" + "showtime=" + showtime + ", seat=" + seat + ", totalprice=" + totalprice + ", combo=" + combo + ", payment=" + payment + ", status=" + status + ", code=" + code + ", date=" + date + '}';
    }

   
    
}
