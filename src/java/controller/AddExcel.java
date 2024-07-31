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
        String role = data.get("role").getAsString();
        int theaterID = data.get("theaterID").getAsInt(); 
        int roleID = 0;

        if (role.equals("Ticket_Checked")) {
            roleID = 3;
        } else if (role.equals("Ticket_Seller")) {
            roleID = 5;
        }

        AccountDAO accountDAO = new AccountDAO();
        Account account = new Account();
        account.setFullname(fullname);
        account.setPhone(phone);
        account.setEmail(email);
        account.setUsername(username);
        account.setPassword(password);
        account.setRole_id(roleID);
        account.setTheaterID(theaterID);

        try {
            accountDAO.insertUser(account);
            response.getWriter().write("{\"success\": true}");
        } catch (Exception e) {
            Logger.getLogger(AddExcel.class.getName()).log(Level.SEVERE, null, e);
            response.getWriter().write("{\"success\": false}");
        }
    }
}
