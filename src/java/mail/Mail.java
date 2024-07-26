
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mail;

import dal.AccountDAO;
import dal.MovieDAO;
import dal.ShowtimingDAO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.imageio.ImageIO;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import model.Account;
import model.Movie;
import model.Showtiming;
import model.Ticket;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class Mail {

    static final String from = "cinebookingvietnam@gmail.com";
    static final String password = "cwdhltxsoqohilws";

    public static boolean sendEmail(String to, Ticket tick) {
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
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        try {
            // Tạo MimeMessage đối tượng
            MimeMessage msg = new MimeMessage(session);

            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(new InternetAddress(from));

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject("CineBooking - Your Movie Ticket");

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Tạo QR code từ mã vé
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(tick.getCode(), BarcodeFormat.QR_CODE, 200, 200);
            BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix);

            // Chuyển đổi hình ảnh QR code thành byte array
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ImageIO.write(qrImage, "png", bos);
            byte[] imageBytes = bos.toByteArray();

            // Tạo phần thân của email
            MimeBodyPart textPart = new MimeBodyPart();
            String htmlContent = "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<style>"
                + "body { font-family: Arial, sans-serif; background-color: #f4f4f9; padding: 20px; }"
                + ".container { max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 10px; background-color: #fff; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }"
                + ".header { text-align: center; margin-bottom: 20px; }"
                + ".header h2 { color: #4CAF50; }"
                + ".details { margin-top: 20px; }"
                + ".details p { margin: 10px 0; font-size: 16px; }"
                + ".details strong { color: #333; }"
                + ".qr-code { text-align: center; margin-top: 20px; }"
                + ".notifications { margin-top: 30px; padding: 15px; background-color: #e9f7ef; border: 1px solid #d4edda; border-radius: 5px; }"
                + ".notifications p { margin: 10px 0; font-size: 16px; color: #155724; }"
                + ".footer { text-align: center; margin-top: 30px; font-size: 14px; color: #666; }"
                + "</style>"
                + "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\">"
                + "</head>"
                + "<body>"
                + "<div class='container'>"
                + "<div class='header'>"
                + "<h2>Thank you for booking a ticket!</h2>"
                + "</div>"
                + "<div class='details'>"
                + "<p><strong>Ticket Code:</strong> ${ticket.code}</p>"
                + "<p><strong>Movie:</strong> ${movie.movie_name}</p>"
                + "<p><strong>Date:</strong> ${show.date} | <strong>Time:</strong> ${show.showtiming}:00</p>"
                + "<p><strong>Room:</strong> ${show.room_name}</p>"
                + "<p><strong>Seat:</strong> ${ticket.seat}</p>"
                + "<p><strong>Combo:</strong> ${ticket.combo}</p>"
                + "<p><strong>Total Price:</strong> ${ticket.totalprice} VND</p>"
                + "<p><strong>User:</strong> ${user.fullname}</p>"
                + "<p><strong>Booking Date:</strong> ${ticket.date}</p>"
                + "</div>"
                + "<div class='qr-code'>"
                + "<img src='cid:qr' style='width: 200px; height: 200px;'/>"
                + "</div>"
                + "<div class='notifications'>"
                + "<p><strong>Important Information:</strong></p>"
                + "<p>Please arrive at the cinema at least 10 minutes before the showtime for check-in.</p>"
                + "<p>The check-in counter will open 1 hour before the showtime and close 1 hour after the showtime starts.</p>"
                + "<p>For movies rated 16 and above, please bring your ID card for age verification.</p>"
                + "</div>"
                + "<div class='footer'>"
                + "<p>We hope you enjoy your movie experience!</p>"
                + "<p>For any inquiries, contact us at support@cinebooking.com</p>"
                + "</div>"
                + "</div>"
                + "</body>"
                + "</html>";

            String totalprice = "" + tick.getTotalprice();
            htmlContent = htmlContent.replace("${ticket.code}", tick.getCode())
                    .replace("${movie.movie_name}", movie.getMovie_name())
                    .replace("${show.date}", show.getDate())
                    .replace("${show.showtiming}", show.getShowtiming())
                    .replace("${show.room_name}", show.getRoom_name())
                    .replace("${ticket.seat}", tick.getSeatToString(tick.getSeat()))
                    .replace("${ticket.combo}", tick.getComboToString(tick.getCombo()))
                    .replace("${ticket.totalprice}", totalprice)
                    .replace("${user.fullname}", user.getFullname())
                    .replace("${ticket.date}", tick.getDate_book());

            textPart.setContent(htmlContent, "text/HTML; charset=UTF-8");

            // Tạo phần đính kèm hình ảnh QR code
            MimeBodyPart imagePart = new MimeBodyPart();
            DataSource fds = new ByteArrayDataSource(imageBytes, "image/png");
            imagePart.setDataHandler(new DataHandler(fds));
            imagePart.setHeader("Content-ID", "<qr>");

            // Tạo multipart message
            MimeMultipart multipart = new MimeMultipart();
            multipart.addBodyPart(textPart);
            multipart.addBodyPart(imagePart);

            // Cài đặt nội dung của email
            msg.setContent(multipart);

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
