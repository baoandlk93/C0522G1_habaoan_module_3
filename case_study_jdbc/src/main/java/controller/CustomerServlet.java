package controller;

import model.person.Customer;
import service.ICustomerTypeService;
import service.impl.CustomerService;
import service.ICustomerService;
import service.impl.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    ICustomerTypeService typeService = new CustomerTypeService();

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
                listCustomer(request, response);
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("customers", customerService.selectByID(id));
        request.setAttribute("customerTypes", typeService.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dateOfBirth");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("customerAddress");
        int customerTypeID = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customer = new Customer(id,name,dayOfBirth,gender,idCard,phoneNumber,email,address,customerTypeID);
        boolean check = customerService.edit(customer);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        String mess = "Update Customer successfully.";

        if (!check) {
            mess = "Update Customer failed.";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.delete(id);
        request.setAttribute("customer",customerService.displayAll());
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerType", typeService.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("customers",customerService.displayAll());
        request.setAttribute("customerTypes",typeService.findAll());
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
                addNewCustomer(request,response);
                break;
            case "edit":
                edit(request,response);
                break;

        }
    }

    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dateOfBirth");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("customerAddress");
        int customerTypeID = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customer = new Customer(name,dayOfBirth,gender,idCard,phoneNumber,email,address,customerTypeID);
        boolean check = customerService.add(customer);
        String mess = "thêm mới thành công";
        if (!check) {
            mess = "thêm mới không thành cônn";
        }
        request.setAttribute("mess", mess);
        showFormAdd(request, response);
    }
}
