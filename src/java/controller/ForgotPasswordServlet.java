package controller;

import dal.AccountDAO;
import model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Tran Anh Vu
 */
public class ForgotPasswordServlet extends HttpServlet {

    private static final String FROM_EMAIL = "cinebookingvietnam@gmail.com";
    private static final String EMAIL_PASSWORD = "cwdh ltxs oqoh ilws";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByEmail(email);

        if (account == null) {
            request.setAttribute("errorMessage", "No account found with that email.");
        } else {

            String resetLink = generateResetLink(account);
            sendEmail(email, "Reset Your Account's Password", resetLink);
            request.setAttribute("successMessage", "Link has been sent to your email.");

        }
        request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
    }

    private String generateResetLink(Account account) {
        return "http://localhost:9999/CineBooking/resetpassword?" + "&email=" + account.getEmail();
    }

    public static boolean sendEmail(String to, String subject, String resetLink) {
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
                return new PasswordAuthentication(FROM_EMAIL, EMAIL_PASSWORD);
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
            msg.setFrom(new InternetAddress(FROM_EMAIL));

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject(subject);

            // Nội dung
            String htmlContent = "<html><body>"
                               + "<table align='center' cellpadding='0' cellspacing='0' width='600' style='border: 1px solid #cccccc;'>"
                               + "<tr>"
                               + "<td align='center' bgcolor='#70bbd9' style='padding: 40px 0 30px 0;'>"
                               + "<h1>Password Reset Request</h1>"
                               + "</td>"
                               + "</tr>"
                               + "<tr>"
                               + "<td bgcolor='#ffffff' style='padding: 40px 30px 40px 30px;'>"
                               + "<p>Dear user,</p>"
                               + "<p>We received a request to reset your password. Please click the link below to reset your password:</p>"
                               + "<p style='text-align: center;'><a href='" + resetLink + "' style='background-color: #4CAF50; color: white; padding: 10px 20px; text-decoration: none; font-size: 16px;'>Reset Password</a></p>"
                               + "<p>If you did not request a password reset, please ignore this email.</p>"
                               + "<p>Thank you,</p>"
                               + "<p>CineBooking Team</p>"
                               + "</td>"
                               + "</tr>"
                               + "</table>"
                               + "</body></html>";

            msg.setContent(htmlContent, "text/HTML; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (MessagingException e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }
}
