/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mail;

/**
 *
 * @author tranh
 */
import dal.AccountDAO;
import dal.MovieDAO;
import dal.ShowtimingDAO;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Account;
import model.Movie;
import model.Showtiming;
import model.Ticket;

public class Mail {

    static final String from = "huythpt194@gmail.com";
    static final String password = "wfkvmtqelytzvftz";

    public static boolean sendEmail(String to,Ticket tick) {
        //
        
        Account user = new AccountDAO().getAccountByID(tick.getAccountId());
        Showtiming show = new ShowtimingDAO().getShowtimingByShowtimeID(tick.getShowtimeId());
        Movie movie = new MovieDAO().getMovieByID(show.getMovie_id());
        
        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(new InternetAddress(from));

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject("CineBooking");

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Quy định email nhận phản hồi
            // msg.setReplyTo(InternetAddress.parse(from, false))
            // Nội dung

            //

            // HTML content
            String htmlContent = "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<style>"
                + "body { font-family: Arial, sans-serif; }"
                + ".container { max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 10px; }"
                + ".header { text-align: center; }"
                + ".header img { max-width: 100%; }"
                + ".details { margin-top: 20px; }"
                + ".details p { margin: 5px 0; }"
                + ".qr-code { text-align: center; margin-top: 20px; }"
                + "</style>"
                + "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\">"
                + "</head>"
                + "<body>"
                + "<div class='container'>"
                + "<div class='header'>"
                + "<h2>Thank you for booking a ticket!</h2>"
                + "<img src='movie_poster_url' alt='Movie Poster'>"
                + "</div>"
                + "<div class='details'>"
                + "<p><strong>Ticket Code:</strong> ${ticket.code}</p>"
                + "<p><strong>Movie:</strong> ${movie.movie_name}</p>"
                + "<p><strong>Date Watch:</strong> ${show.date} | <strong>Time:</strong> ${show.showtiming}:00</p>"
                + "<p><strong>Room:</strong> ${show.room_name}</p>"
                + "<p><strong>Seat:</strong> ${ticket.seat}</p>"
                + "<p><strong>Combo:</strong> ${ticket.combo}</p>"
                + "<p><strong>Total Price:</strong> ${ticket.totalprice} VND</p>"
                + "<p><strong>User:</strong> ${user.fullname}</p>"
                + "<p><strong>Date Book:</strong> ${ticket.date}</p>"
                + "</div>"
                + "<div class='qr-code'>"
                + "<img src='generateQR?text=${ticket.code}' style='width: 200px; height: 200px;'/>"
                + "</div>"
                + "</div>"
                + "</body>"
                + "</html>";

            String totalprice = ""+ tick.getTotalprice();
            // Replacing placeholders with actual values
            htmlContent = htmlContent.replace("${ticket.code}", tick.getCode())
                    .replace("${movie.movie_name}", movie.getMovie_name())
                    .replace("${show.date}", show.getDate())
                    .replace("${show.showtiming}", show.getShowtiming())
                    .replace("${show.room_name}", show.getRoom_name())
                    .replace("${ticket.seat}", tick.getSeatToString(tick.getSeat()))
                    .replace("${ticket.combo}", tick.getComboToString(tick.getCombo()))
                    .replace("${ticket.totalprice}", totalprice)
                    .replace("${user.fullname}", user.getFullname())
                    .replace("${ticket.date}", tick.getDate_book())
                    ;

            
            // Set content
            msg.setContent(htmlContent, "text/HTML; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }
}
