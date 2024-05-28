/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author VuTA
 */
//url : view/admin/adduser
@WebServlet(name = "AddUser", urlPatterns = {"/views/admin/adduser"})
public class AddUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("repassword");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        AccountDAO accountDAO = new AccountDAO();

        // Validate input
        // Check rePassword
        if (!password.equals(rePassword)) {
            request.setAttribute("errorMessage", "Passwords do not match");
            request.getRequestDispatcher("views/admin/adduser.jsp").forward(request, response);
            return;
        }
        
        // Check valid "Phone" format
        if (!phone.matches("\\d{10}")) {
            request.setAttribute("errorMessage", "Phone must be a string of exactly 10 digits");
            request.getRequestDispatcher("views/admin/adduser.jsp").forward(request, response);
            return;
        }
        
        // Check valid "Email" format
        if (!email.matches("^[^ ]+@gmail\\.com$")) {
            request.setAttribute("errorMessage", "Email must be in the format of 'example@gmail.com' with no spaces");
            request.getRequestDispatcher("views/admin/adduser.jsp").forward(request, response);
            return;
        }
        
        // Check is "Username" exists
        if (accountDAO.usernameExists(username)) {
            request.setAttribute("errorMessage", "Username already exists");
            request.getRequestDispatcher("views/admin/adduser.jsp").forward(request, response);
            return;
        }

        // Create a new account object
        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        account.setFullname(fullname);
        account.setPhone(phone);
        account.setEmail(email);
        account.setRole_id(2);

        // Insert the new account into the database
        accountDAO.insertUser(account);

        // Back to the add user page
        request.setAttribute("successMessage", "Add staff success");
        request.getRequestDispatcher("views/admin/adduser.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
