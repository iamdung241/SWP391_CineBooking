package controller.admin.assgin;

import dal.TaskDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Theater;

public class CreateTask extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login");
            return;
        }
        TaskDAO taskDao = new TaskDAO();
        ArrayList<Theater> theaters = taskDao.getListThreaters();

        request.setAttribute("theaters", theaters);
        request.getRequestDispatcher("/views/assign/createTask.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String theaterId = request.getParameter("theaterId");
        String accountId = request.getParameter("accountId");
        String description = request.getParameter("description");
        TaskDAO taskDao = new TaskDAO();
        taskDao.insertTask(title, description, accountId);
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(3);
        session.setAttribute("status", "success");
        session.setAttribute("mess", "Add task success!");
        response.sendRedirect("./ManagerAssignment");
    }

}
