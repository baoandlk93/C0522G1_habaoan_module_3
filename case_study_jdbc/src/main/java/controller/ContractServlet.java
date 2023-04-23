package controller;

import service.*;
import service.impl.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    private ICustomerTypeService typeService = new CustomerTypeService();
    private IEmployeeService employeeService = new EmployeeService();
    private IContractService contractService = new ContractService();
    private IFacilityService facilityService = new FacilityService();
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
                listContract(request, response);
        }
    }

    private void listContract(HttpServletRequest request, HttpServletResponse response) {

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/list.jsp");
        request.setAttribute("customers",customerService.displayAll());
        request.setAttribute("customerTypes",typeService.findAll());
        request.setAttribute("employees",employeeService.findAll());
        request.setAttribute("contracts",contractService.findAll().values());
        request.setAttribute("facility",facilityService.displayAll());
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
//        request.setAttribute("customers", customerService.selectByID(id));
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher =request.getRequestDispatcher("view/contract/create.jsp");
        try {
            dispatcher.forward(request,response);
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
            case "create":

                break;
            case "edit":

                break;
        }
    }
}
