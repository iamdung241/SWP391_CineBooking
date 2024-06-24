/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import model.Account;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Tran Anh Vu
 */
public class ResetPasswordServlet extends HttpServlet {
   
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByEmail(email);

        if (account == null) {
            request.setAttribute("errorMessage", "Invalid token.");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
            return;
        }

        String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?])[A-Za-z\\d!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]{8,20}$";

        if (!newPassword.matches(passwordPattern)) {
            request.setAttribute("errorMessage", "Password must be 8-20 characters long, contain uppercase and lowercase letters, numbers, special characters, and not contain any spaces.");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
            return;
        } 

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
            return;
        }

        accountDAO.updatePasswordByEmail(account.getEmail(), newPassword);
        request.setAttribute("successMessage", "Password has been reset successfully.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
    }
}
