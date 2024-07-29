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
//url: /register
public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve user inputs from the request
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Check if the username already exists
        Vector<Account> vector = (new AccountDAO()).getAllAccount();
        for (Account user : vector) {
            if (user.getUsername().equals(username)) {
                // Username already exists, set error message and forward back to register.jsp
                req.setAttribute("existedUsername", "Username is already exists, try again!");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
                return; // Exit the method to prevent further processing
            }
            if (user.getEmail().equals(email)) {
                // Username already exists, set error message and forward back to register.jsp
                req.setAttribute("existedEmail", "Email is already exists, try again!");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
                return; // Exit the method to prevent further processing
            }
        }

        // Proceed with registration if validation passes
        AccountDAO dao = new AccountDAO();
        Account newUser = new Account(fullname, phone, email, username, password, 4, 1);
        dao.insertUser(newUser);

        // Set success message and forward to register.jsp
        req.setAttribute("registerSuccess", "Registration successful. Click here to login.");
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

}
