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

/**
 *
 * @author Tran Anh Vu
 */
public class LoginGoogle extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        
        // Nếu người dùng hủy ủy quyền
        if(error != null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Lấy access token và thông tin người dùng từ Google
        Google gg = new Google();
        String accessToken = gg.getToken(code);
        GoogleAccount googleAccount = gg.getUserInfo(accessToken);

        // Tìm tài khoản trong cơ sở dữ liệu bằng email
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByEmail(googleAccount.getEmail());

        // Xử lý đăng nhập dựa trên kết quả xác thực
        if (account == null) {
            // Không tìm thấy tài khoản, chuyển hướng về trang login với thông báo lỗi
            request.setAttribute("usernameOrPasswordWrong", "No account associated with this Google email!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Tạo session cho người dùng và chuyển hướng tới trang tương ứng
            HttpSession session = request.getSession();
            session.setAttribute("user", account);

            if (account.getRole_id() == 3) {
                // Khách hàng
                response.sendRedirect("home");
            } else if (account.getRole_id() == 1) {
                // Admin
                response.sendRedirect("dashboard");
            } else if (account.getRole_id() == 2) {
                // Nhân viên quét vé
                response.sendRedirect("scanticket");
            }
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
