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
        String hashPass = new AccountDAO().md5(password);
        String rePassword = request.getParameter("repassword");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        AccountDAO accountDAO = new AccountDAO();

        Account account = new Account();
        request.setAttribute("successMessage", "Add Staff Successfully");
        account.setUsername(username);
        account.setPassword(hashPass);
        account.setFullname(fullname);
        account.setPhone(phone);
        account.setEmail(email);
        account.setRole_id(2);

        accountDAO.insertUser(account);

        request.getRequestDispatcher("/views/dashboard/adduser.jsp").forward(request, response);
    }
}
