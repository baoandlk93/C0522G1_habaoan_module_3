import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        float percent = Float.parseFloat(request.getParameter("percent"));

        float amount = (float) (price * percent * 0.01);
        float newPrice = price - amount;
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("n1", description);
        request.setAttribute("n2", price);
        request.setAttribute("n3", percent);
        request.setAttribute("n4", amount);
        request.setAttribute("n5", newPrice);
        requestDispatcher.forward(request, response);
    }
}
