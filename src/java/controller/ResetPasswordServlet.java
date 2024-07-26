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
    
        request.setAttribute("newPassword", newPassword);
        request.setAttribute("confirmPassword", confirmPassword);
        boolean isValid = true;

        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByEmail(email);

        String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,20}$";
        if (!newPassword.matches(passwordPattern)) {
            request.setAttribute("errorNew", "Password must be 6-20 characters long, contain letters and numbers, and cannot contain spaces or be all spaces.");
            isValid = false;
        } 
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorConfirm", "Passwords do not match");
            isValid = false;
        }
        
        if (isValid) {
            accountDAO.updatePasswordByEmail(account.getEmail(), newPassword);
            request.setAttribute("successMessage", "Change password successfully! Click here to login.");
            request.setAttribute("newPassword", null);
            request.setAttribute("confirmPassword", null);
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
    }
}
