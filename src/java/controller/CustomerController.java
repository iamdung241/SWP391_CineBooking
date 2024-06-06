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
import model.Account;

/**
 *
 * @author DungTT
 */
public class CustomerController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO accDAO = new AccountDAO();
        String accID = request.getParameter("userID");
        int accountID = Integer.parseInt(accID);
        try {
            
            Account account = accDAO.getAccountByID(accountID);
            request.setAttribute("account", account);
            request.getRequestDispatcher("/views/homepage/UserProfile.jsp").forward(request, response);
        } catch(NumberFormatException e) {
            e.printStackTrace();
        }
//        String service = request.getParameter("service");
//        if (service.equals("updateProfile")){
//            
//        }
    }
    
}