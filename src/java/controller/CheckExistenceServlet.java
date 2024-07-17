package controller;

import com.google.gson.Gson;
import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


public class CheckExistenceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        AccountDAO accountDAO = new AccountDAO();
        boolean usernameExists = accountDAO.usernameExists(username);
        boolean phoneExists = accountDAO.phoneExists(phone);
        boolean emailExists = accountDAO.emailExists(email);

        Map<String, Boolean> jsonResponse = new HashMap<>();
        jsonResponse.put("usernameExists", usernameExists);
        jsonResponse.put("phoneExists", phoneExists);
        jsonResponse.put("emailExists", emailExists);

        Gson gson = new Gson();
        String json = gson.toJson(jsonResponse);

        response.setContentType("application/json");
        response.getWriter().write(json);
    }
}
