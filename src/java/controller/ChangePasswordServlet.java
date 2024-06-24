package controller;

import dal.AccountDAO;
import model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * Author: Tran Anh Vu
 */
public class ChangePasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByID(userID);

        if (account != null && account.getPassword().equals(oldPassword)) {
            String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?])[A-Za-z\\d!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]{8,20}$";
            if (!newPassword.matches(passwordPattern)) {
                request.setAttribute("errorMessage", "Password must be 8-20 characters long, contain uppercase and lowercase letters, numbers, special characters, and not contain any spaces");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            } 
            else if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Passwords do not match");
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            }
            else if (newPassword.equals(confirmPassword)) {
                accountDAO.updatePasswordByID(userID, newPassword);
                response.sendRedirect("login.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid old password.");
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
        }
    }
}
