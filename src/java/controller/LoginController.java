package controller;

import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 *
 * @author DungTT
 */
//url : /login
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the current session or create a new one if it doesn't exist
        HttpSession session = req.getSession();

        // Retrieve username and password from the request
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String returnUrl = req.getParameter("returnUrl");

        // Attempt to authenticate the user
        Account user = (new AccountDAO()).login(username, password);
        //System.out.println(user.getUsername());

        // Handle login flow based on authentication result
        if (user == null) {
            // Invalid username or password, forward back to login page with error message
            req.setAttribute("usernameOrPasswordWrong", "Username or Password is invalid!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            session.setAttribute("user", user);
            if (returnUrl != null && !returnUrl.isEmpty()) {
                resp.sendRedirect(returnUrl);
            } else if (user.getRole_id() == 3) {
                // Customer role
                resp.sendRedirect("home");
            } else if (user.getRole_id() == 1) {
                // Admin role
                resp.sendRedirect("dashboard");
            } else if(user.getRole_id() == 2) {
                resp.sendRedirect("scanticket");
            }
        }    
    }
}