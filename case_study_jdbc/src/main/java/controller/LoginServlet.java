package controller;

import model.person.Role;
import model.person.User;
import org.mindrot.jbcrypt.BCrypt;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    private IUserService userService = new UserService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                login(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                authorize(request, response);

        }
    }

    private void authorize(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean check = false;
        User user = userService.findUserByUsername(username);
        Role role = userService.getRoleFromUser(username);
        boolean isPasswordCorrect = BCrypt.checkpw(password, user.getPassword());
        String mess;
        RequestDispatcher dispatcher;
        if (isPasswordCorrect) {
            Cookie userCookies = new Cookie("user", user.getUserName() + user.getPassword());
            userCookies.setMaxAge(24 * 60 * 60); // Đặt thời gian tồn tại của cookie (tính bằng giây)
            response.addCookie(userCookies); //
            Cookie roleCookie = new Cookie("role", role.getRoleName());
            roleCookie.setMaxAge(24 * 60 * 60);
            response.addCookie(roleCookie);
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role.getRoleName());
            check = true;
            mess = "Đăng nhập thành công";
            request.setAttribute("mess", mess);
            request.setAttribute("check", check);

            if (role.getRoleName().equals("ADMIN")) {
                dispatcher = request.getRequestDispatcher("adminPage.jsp");
                dispatcher.forward(request, response);
            }
            if (role.getRoleName().equals("USER")) {
                dispatcher = request.getRequestDispatcher("userPage.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            dispatcher = request.getRequestDispatcher("login.jsp");
            mess = "Sai tài khoản hoặc mật khẩu !";
            request.setAttribute("mess", mess);
            request.setAttribute("check", check);
            dispatcher.forward(request, response);
        }
    }
}
