package controller;

import model.ClassCG;
import model.Student;
import service.IClassCGService;
import service.IStudentService;
import service.impl.ClassCGService;
import service.impl.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "controller.StudentServlet", urlPatterns = {"/student"})
public class StudentServlet extends HttpServlet {
    private IStudentService studentService = new StudentService();
    private IClassCGService classCGService = new ClassCGService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                // lấy dữ liêu và lưu vào db
                save(request,response);
                break;
            case "delete":
                // xoá
                delete(request,response);
                break;
            default:
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = studentService.delete(idDelete);
        String mess ="xoa thành công";
        if (!check){
            mess =" xoá không thành công";
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/list.jsp");
        request.setAttribute("studentList", this.studentService.findAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender =Boolean.parseBoolean(request.getParameter("gender"));
        String birthday =request.getParameter("birthday");
        String email = request.getParameter("email");
        int point =Integer.parseInt(request.getParameter("point"));
        int classId=Integer.parseInt(request.getParameter("classId"));
//        String account = request.getParameter("account");
        // account lấy theo email
        Student student = new Student(name,gender,birthday,point,email,classId,email);
        Map<String,String> map  =studentService.add(student);
        String mess ="Thêm mới thành công !";
        if (!map.isEmpty()){
            mess="Thêm mới không thành công";
            request.setAttribute("error",map);
        }
        request.setAttribute("mess", mess);
        request.setAttribute("classList",this.classCGService.findByAll());
        try {
            request.getRequestDispatcher("view/student/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request,response);
                // thêm mới
                break;
            case "search":
                // search
                search(request,response);
                break;
            case "delete":
                // xoá
                break;
            case "transaction":
                goToTransaction(request,response);
                break;
            default:
                // trả về trang list
                showListStudent(request, response);
        }

    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String nameSearch = request.getParameter("nameSearch");
        String accountSearch = request.getParameter("accountSearch");
        String classIdSearch = request.getParameter("classIdSearch");
        List<Student> studentList = studentService.search(nameSearch,accountSearch,classIdSearch);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/list.jsp");
        List<ClassCG> classCGList = classCGService.findByAll();
        request.setAttribute("classList", classCGList);
        request.setAttribute("studentList", studentList);
        request.setAttribute("nameSearch", nameSearch);
        request.setAttribute("accountSearch", accountSearch);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<ClassCG> classCGList = classCGService.findByAll();
        request.setAttribute("classList", classCGList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/create.jsp");

        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListStudent(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/list.jsp");

        request.setAttribute("studentList", this.studentService.findAll());
        request.setAttribute("classList",this.classCGService.findByAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void goToTransaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mess = studentService.transaction();
        request.setAttribute("mess",mess);
        request.getRequestDispatcher("view/result_transaction.jsp").forward(request,response);

    }
}
