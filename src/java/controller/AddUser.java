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

        // Validate Fullname
        if (!fullname.matches("^(?!\\s*$)[a-zA-Z\\s]{8,30}$")) {
            request.setAttribute("errorFullname", "Fullname must be 8-30 characters long, only contain letters and spaces, and cannot be all spaces");
            isValid = false;
        }

        // Validate Phone
        if (!phone.matches("\\d{10,15}")) {
            request.setAttribute("errorPhone", "Phone must be a string of 10-15 digits");
            isValid = false;
        }

        // Validate Email
        if (!email.matches("^[^\\s]+@(gmail\\.com|fpt\\.edu\\.vn)$")) {
            request.setAttribute("errorEmail", "Email must be in the format of 'example@gmail.com' or 'example@fpt.edu.vn' with no spaces");
            isValid = false;
        }

        // Validate Username
        if (!username.matches("^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]{8,20}$")) {
            request.setAttribute("errorUsername", "Username must be 8-20 characters long, contain both letters and numbers, and not contain any spaces");
            isValid = false;
        } else if (accountDAO.usernameExists(username)) {
            request.setAttribute("errorUsername", "Username already exists");
            isValid = false;
        }

        // Validate Password
        String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?])[A-Za-z\\d!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]{8,20}$";
        if (!password.matches(passwordPattern)) {
            request.setAttribute("errorPassword", "Password must be 8-20 characters long, contain uppercase and lowercase letters, numbers, special characters, and not contain any spaces");
            isValid = false;
        }
        

        // Validate Re-Password
        if (!password.equals(rePassword)) {
            request.setAttribute("errorRePassword", "Re-entered password does not match the password");
            isValid = false;
        }

        // If initial validations pass, check for unique phone and email
        if (isValid) {
            if (accountDAO.phoneExists(phone)) {
                request.setAttribute("errorPhone", "Phone number already exists");
                isValid = false;
            }

            if (accountDAO.emailExists(email)) {
                request.setAttribute("errorEmail", "Email already exists");
                isValid = false;
            }
        }

        // If all validations pass, insert the new account
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
        }

        // Forward to the JSP with error messages or success message
        request.getRequestDispatcher("adduser.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
