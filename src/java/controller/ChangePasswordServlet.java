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

        request.setAttribute("oldPassword", oldPassword);
        request.setAttribute("newPassword", newPassword);
        request.setAttribute("confirmPassword", confirmPassword);
        boolean isValid = true;

        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByID(userID);

        String hashPass = new AccountDAO().md5(oldPassword);

        String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,20}$";
        if (!newPassword.matches(passwordPattern)) {
            request.setAttribute("errorNew", "Password must be 6-20 characters long, contain letters and numbers, and cannot contain spaces or be all spaces.");
            isValid = false;
        }
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorConfirm", "Passwords do not match");
            isValid = false;
        }
        if (account == null || !account.getPassword().equals(hashPass)) {
            request.setAttribute("errorOld", "Invalid old password.");
            isValid = false;
        }

        if (isValid) {
            accountDAO.updatePasswordByID(userID, newPassword);
            request.setAttribute("successMessage", "Change password successfully");
            request.setAttribute("oldPassword", null);
            request.setAttribute("newPassword", null);
            request.setAttribute("confirmPassword", null);
            response.sendRedirect("login.jsp");
        } else {
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
        }
    }
}
