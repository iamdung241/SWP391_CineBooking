package controller;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet(name = "AddUser", urlPatterns = {"/views/admin/adduser"})
public class AddUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("repassword");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        AccountDAO accountDAO = new AccountDAO();
        boolean isValid = true;

        // Set the entered values as request attributes to retain the input
        request.setAttribute("username", username);
        request.setAttribute("fullname", fullname);
        request.setAttribute("phone", phone);
        request.setAttribute("email", email);

        if (!username.matches("^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]{8,20}$")) {
            request.setAttribute("errorUsername", "Username must be 8-20 characters long, contain both letters and numbers, and not contain any spaces");
            isValid = false;
        } else if (accountDAO.getAccountByUsername(username) != null) {
            request.setAttribute("errorUsername", "Username already exists");
            isValid = false;
        }
        
        String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,20}$";
        if (!password.matches(passwordPattern)) {
            request.setAttribute("errorPassword", "Password must be 6-20 characters long, contain letters and numbers, and cannot contain spaces or be all spaces.");
            isValid = false;
        } else if (!password.equals(rePassword)) {
            request.setAttribute("errorRePassword", "Passwords do not match");
            isValid = false;
        }

        if (!fullname.matches("^(?!\\s*$)[a-zA-Z\\s]{8,30}$")) {
            request.setAttribute("errorFullname", "Fullname must be 8-30 characters long, only contain letters and spaces, and cannot be all spaces");
            isValid = false;
        }

        if (accountDAO.phoneExists(phone)) {
            request.setAttribute("errorPhone", "Phone number already exists");
            isValid = false;
        } else if (!phone.matches("\\d{10,15}")) {
            request.setAttribute("errorPhone", "Phone must be a string of 10-15 digits");
            isValid = false;
        }

        if (accountDAO.emailExists(email)) {
            request.setAttribute("errorEmail", "Email already exists");
            isValid = false;
        } else if (!email.matches("^[^\\s]+@(gmail\\.com|fpt\\.edu\\.vn)$")) {
            request.setAttribute("errorEmail", "Email must be in the format of 'example@gmail.com' or 'example@fpt.edu.vn' with no spaces");
            isValid = false;
        }

        if (isValid) {
            Account account = new Account();
            account.setUsername(username);
            account.setPassword(password);
            account.setFullname(fullname);
            account.setPhone(phone);
            account.setEmail(email);
            account.setRole_id(2);

            accountDAO.insertUser(account);

            request.setAttribute("successMessage", "Add staff success");
            request.setAttribute("username", null);
            request.setAttribute("fullname", null);
            request.setAttribute("phone", null);
            request.setAttribute("email", null);
        }
        request.getRequestDispatcher("/views/admin/addUser.jsp").forward(request, response);
    }
}
