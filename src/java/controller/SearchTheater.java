/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.TheaterDAO;
import model.Account;
import model.Theater;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

/**
 *
 * @author Tran Anh Vu
 */
public class SearchTheater extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("query");

        TheaterDAO theaterDAO = new TheaterDAO();
        AccountDAO accountDAO = new AccountDAO();

        Vector<Theater> theaters;
        if (searchQuery == null || searchQuery.isEmpty()) {
            theaters = theaterDAO.getAllTheaters();
        } else {
            theaters = theaterDAO.searchTheatersByManagerName(searchQuery);
        }

        Vector<Account> managers = new Vector<>();
        Vector<Integer> staffCounts = new Vector<>();

        for (Theater theater : theaters) {
            Account manager = accountDAO.getManagerByTheaterID(theater.getId());
            int staffCount = accountDAO.getStaffCountByTheaterID(theater.getId());
            managers.add(manager);
            staffCounts.add(staffCount);
        }

        request.setAttribute("theaters", theaters);
        request.setAttribute("managers", managers);
        request.setAttribute("staffCounts", staffCounts);


        request.getRequestDispatcher("views/dashboard/managetheater.jsp").forward(request, response);
    }
}
