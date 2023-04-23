package config;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebFilter(filterName = "AuthorizationFilter",value = "/admin")
public class AuthorizationFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
//        request.setCharacterEncoding("UTF-8");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Kiểm tra quyền hạn của người dùng
        if (httpRequest.isUserInRole("USER")) {
            // Người dùng có quyền truy cập, cho phép đi tiếp đến servlet hoặc tài nguyên
            chain.doFilter(request, response);
        } else {
//            request.setAttribute("mess", "Sai tài khoản hoặc mật khẩu !");
//            request.setAttribute("check", true);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

}
