package controller;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.GoogleAccount;

public class LoginGoogle extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        
        if (error != null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        Google gg = new Google();
        String accessToken = gg.getToken(code);
        GoogleAccount googleAccount = gg.getUserInfo(accessToken);

        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByEmail(googleAccount.getEmail());

        if (account == null) {
            account = new Account();
            account.setFullname(googleAccount.getFamily_name() + " " + googleAccount.getGiven_name());
            account.setPhone("");
            account.setUsername(googleAccount.getName());
            account.setEmail(googleAccount.getEmail());
            account.setRole_id(3);
            
            accountDAO.insertUserFromGoogle(account);
            account = accountDAO.getAccountByGoogleEmail(googleAccount.getEmail());
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("user", account);

        switch (account.getRole_id()) {
            case 3:
                response.sendRedirect("home");
                break;
            case 1:
                response.sendRedirect("dashboard");
                break;
            case 2:
                response.sendRedirect("scanticket");
                break;
            default:
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
}
