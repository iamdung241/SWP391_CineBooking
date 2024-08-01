
package controller.admin.assgin;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dal.TaskDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;

public class AccountJSon extends HttpServlet {
   
  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          response.setContentType("application/json;charset=UTF-8");
        String theaterId = request.getParameter("theaterId");
        TaskDAO taskDao = new TaskDAO();
        ArrayList<Account> listAccount = taskDao.getAccountByTheater(theaterId);
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(listAccount);
        System.out.println(json);
        response.getWriter().write(json);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }


}
