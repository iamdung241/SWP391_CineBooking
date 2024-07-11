/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 *
 * @author Tran Anh Vu
 */
public class RefererFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Mã khởi tạo, nếu cần thiết
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String referer = httpRequest.getHeader("Referer");

         //Kiểm tra nếu referer là null hoặc không đến từ chính ứng dụng
//        if (referer == null || !referer.startsWith(httpRequest.getScheme() + "://" + httpRequest.getServerName())) {
//            // Chặn truy cập và chuyển hướng đến trang lỗi
//            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error.jsp");
//            return;
//        }

        // Chuyển yêu cầu tiếp tục trong chuỗi lọc
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Mã dọn dẹp, nếu cần thiết
    }
}