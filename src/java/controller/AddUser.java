package controller;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

public class AddUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int role = Integer.parseInt(request.getParameter("role"));
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        int theaterID = Integer.parseInt(request.getParameter("theaterID"));

        AccountDAO accountDAO = new AccountDAO();

        Account account = new Account();    
        account.setUsername(username);
        account.setPassword(password);
        account.setFullname(fullname);
        account.setPhone(phone);
        account.setEmail(email);
        account.setRole_id(role);
        account.setTheaterID(theaterID);

        accountDAO.insertUser(account);
        request.setAttribute("successMessage", "Add Staff Successfully");
        request.getRequestDispatcher("/views/dashboard/adduser.jsp").forward(request, response);
    }
}
