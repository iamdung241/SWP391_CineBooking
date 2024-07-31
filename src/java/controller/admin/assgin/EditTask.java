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
import model.Task;
import model.Theater;

public class EditTask extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String taskId = request.getParameter("taskId");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login");
            return;
        }

        TaskDAO taskDao = new TaskDAO();
        Task task = taskDao.getTaskById(taskId);
        ArrayList<Theater> theaters = taskDao.getListThreaters();
        Account account = taskDao.getAccountById(task.getAccountId());
        ArrayList<Account> accounts = taskDao.getAccountByTheater(account.getTheaterID()+"");
        
        request.setAttribute("account", account);
        request.setAttribute("accounts", accounts);
        request.setAttribute("theaters", theaters);
        request.setAttribute("task", task);
        request.getRequestDispatcher("/views/assign/editTask.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String id = request.getParameter("id");
         String title = request.getParameter("title");
        String theaterId = request.getParameter("theaterId");
        String accountId = request.getParameter("accountId");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        TaskDAO taskDao = new TaskDAO();
        taskDao.updateTask(id, title, description, accountId, status);
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(3);
        session.setAttribute("status", "success");
        session.setAttribute("mess", "Update task success!");
        response.sendRedirect("./ManagerAssignment");
    }

}
