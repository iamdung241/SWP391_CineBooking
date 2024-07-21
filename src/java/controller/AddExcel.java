package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.AccountDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

public class AddExcel extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("application/json");
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        JsonObject data = gson.fromJson(reader, JsonObject.class);
        
        String fullname = data.get("fullname").getAsString();
        String phone = data.get("phone").getAsString();
        String email = data.get("email").getAsString();
        String username = data.get("username").getAsString();
        String password = data.get("password").getAsString();

        AccountDAO accountDAO = new AccountDAO();
        Account account = new Account();
        account.setFullname(fullname);
        account.setPhone(phone);
        account.setEmail(email);
        account.setUsername(username);
        account.setPassword(password);
        account.setRole_id(2); // Assuming role_id for staff is 2

        try {
            accountDAO.insertUser(account);
            response.getWriter().write("{\"success\": true}");
        } catch (Exception e) {
            Logger.getLogger(AddExcel.class.getName()).log(Level.SEVERE, null, e);
            response.getWriter().write("{\"success\": false}");
        }
    }
}
