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
    private int showtime;
    private String seat;
    private int totalprice;
    private String combo;
    private String payment;
    private String status;

    public Ticket() {
    }

    public Ticket(int showtime, String seat, int totalprice, String combo, String payment, String status) {
        this.showtime = showtime;
        this.seat = seat;
        this.totalprice = totalprice;
        this.combo = combo;
        this.payment = payment;
        this.status = status;
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

    @Override
    public String toString() {
        return "Ticket{" + "showtime=" + showtime + ", seat=" + seat + ", totalprice=" + totalprice + ", combo=" + combo + ", payment=" + payment + ", status=" + status + '}';
    }
    
}
