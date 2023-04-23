package controller;

import model.person.Employee;
import service.IDivisionService;
import service.IEducationService;
import service.IEmployeeService;
import service.IPositionService;
import service.impl.DivisionService;
import service.impl.EducationService;
import service.impl.EmployeeService;
import service.impl.PositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
   IEmployeeService employeeService = new EmployeeService();
   IEducationService educationService = new EducationService();
   IPositionService positionService = new PositionService();
   IDivisionService divisionService = new DivisionService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormAdd(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "edit":
                showFormEdit(request,response);
                break;
            default:
                listEmployee(request, response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.delete(id);
        request.setAttribute("employee",employeeService.findAll());
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("employee", employeeService.selectByID(id));
        request.setAttribute("divisions", divisionService.displayAll());
        request.setAttribute("positions", positionService.displayAll());
        request.setAttribute("educations", educationService.displayAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        request.setAttribute("employees", employeeService.findAll());
        request.setAttribute("divisions", divisionService.displayAll());
        request.setAttribute("positions", positionService.displayAll());
        request.setAttribute("educations", educationService.displayAll());
        try {
            dispatcher.forward(request,response);
        }
        catch (ServletException | IOException e){
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
            case "create":
                addNewEmployee(request,response);
                break;
            case "edit":
                edit(request,response);
                break;


        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int educationId = Integer.parseInt(request.getParameter("education"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        double salary = Double.parseDouble(request.getParameter("salary"));
        Employee employee = new Employee(id,name,dayOfBirth,idCard,phoneNumber,email,address,positionId,educationId,divisionId,salary);
        boolean check = employeeService.edit(employee);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        String mess = "Update Employee successfully.";

        if (!check) {
            mess = "Update Employee failed.";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }


    }

    private void addNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dayOfBirth");
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int educationId = Integer.parseInt(request.getParameter("education"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        double salary = Double.parseDouble(request.getParameter("salary"));

        Employee employee = new Employee(name,dayOfBirth,idCard,phoneNumber, email,address,positionId,educationId,divisionId,salary);
        boolean check = employeeService.add(employee);
        String mess = "thêm mới thành công";
        if (!check) {
            mess = "thêm mới không thành cônn";
        }
        request.setAttribute("mess", mess);
        showFormAdd(request, response);

    }
}
