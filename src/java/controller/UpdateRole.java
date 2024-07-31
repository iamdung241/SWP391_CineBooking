/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author VuTA
 */
@WebServlet(name = "UpdateRole", urlPatterns = {"/views/dashboard/updateRole"})
public class UpdateRole extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Change String type into Integer type
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        int roleId = Integer.parseInt(request.getParameter("roleId"));

        //Update account's role
        AccountDAO accountDAO = new AccountDAO();
        accountDAO.updateAccountRole(accountId, roleId);

        // Back to the account detail page
        response.sendRedirect("staffdetail.jsp?id=" + accountId);
    }
}
