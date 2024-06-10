/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;
import model.Account;

/**
 *
 * @author DungTT
 */
public class CustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "";
        }

        AccountDAO accDAO = new AccountDAO();
        String accID = request.getParameter("userID");

        if (accID != null && !accID.isEmpty()) {
            int accountID;
            try {
                accountID = Integer.parseInt(accID);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                return;
            }

            if (service.equals("updateProfile")) {
                String fullname = request.getParameter("fullname");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String username = request.getParameter("username");

                if (fullname != null && phone != null && email != null && username != null) {
                    Account account = new Account();
                    account.setFullname(fullname);
                    account.setPhone(phone);
                    account.setEmail(email);
                    account.setUsername(username);

                    accDAO.updateAccount(accountID, account);

                    // Set a success message
                    request.setAttribute("message", "Profile updated successfully!");

                    // Retrieve updated account information
                    Account updatedAccount = accDAO.getAccountByID(accountID);
                    request.setAttribute("account", updatedAccount);

                    // Forward to profile page with updated information
                    request.getRequestDispatcher("/views/homepage/UserProfile.jsp").forward(request, response);
                }
                return;
            }

            try {
                Account account = accDAO.getAccountByID(accountID);
                request.setAttribute("account", account);
                request.getRequestDispatcher("/views/homepage/UserProfile.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
