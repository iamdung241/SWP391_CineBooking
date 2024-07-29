/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.Account;

/**
 *
 * @author Tran Anh Vu
 */
public class SearchAccountAdmin extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String searchQuery = request.getParameter("query");
        String roleFilter = request.getParameter("role");
        String theaterFilter = request.getParameter("theater");
        AccountDAO accountDAO = new AccountDAO();
        Vector<Account> accounts = accountDAO.searchAccounts(searchQuery, roleFilter, theaterFilter);
        if(searchQuery.isBlank() && roleFilter.isBlank() && theaterFilter.isBlank()){
            response.sendRedirect("views/dashboard/manageuser.jsp");
        }
        else {
            request.setAttribute("accounts", accounts);
            request.getRequestDispatcher("views/dashboard/manageuser.jsp").forward(request, response);
        }
    } 
}
