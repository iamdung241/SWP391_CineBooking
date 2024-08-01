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

public class ManagerAssign extends HttpServlet {

    int itemPerPage = 5;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status_raw = request.getParameter("status");
        String keyword_raw = request.getParameter("keyword");
        String page_raw = request.getParameter("page");
        String keyword = (keyword_raw == null) ? "" : keyword_raw;
        String status = "";

        TaskDAO taskDao = new TaskDAO();
        ArrayList<Task> listAllTasks = taskDao.getAllTasks(status, keyword);
        if (status_raw != null) {
            status = status_raw;
        }
        int currentPage = 1;
        if (page_raw != null) {
            currentPage = Integer.parseInt(page_raw);
        }
        int totalPages = (int) Math.ceil((double) listAllTasks.size() / itemPerPage);
        ArrayList<Task> listTasks = taskDao.getTaskPage(status, keyword, currentPage, itemPerPage);
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login");
            return;
        }
        System.out.println(listTasks);
        ArrayList<Account> accounts = taskDao.getAccountByTheater(acc.getTheaterID() + "");
        for (Task t : listTasks) {
            for (Account a : accounts) {
                if (t.getAccountId().equals(a.getAccount_id() + "")) {
                    t.setNameAccount(a.getFullname());
                    break;
                }
            }
        }
        request.setAttribute("status", status);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("keyword", keyword_raw);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("itemPerPage", itemPerPage);
        request.setAttribute("tasks", listTasks);
        request.getRequestDispatcher("/views/assign/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
