import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DisplayServlet", value = "/display")
public class DisplayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String address = request.getParameter("address");
        String linkImg = request.getParameter("img");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("n1", name);
        request.setAttribute("n2", date);
        request.setAttribute("n3", address);
        request.setAttribute("n4", linkImg);
        requestDispatcher.forward(request, response);


    }
}
