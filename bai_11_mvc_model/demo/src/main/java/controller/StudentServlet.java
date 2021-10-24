package controller;

import entity.Student;
import service.StudentService;
import service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"","/list","/student"})
public class StudentServlet extends HttpServlet {
    private StudentService studentService = new StudentServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        switch (action){
            case "update":
                updateStudent(request,response);
                break;
        }
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        Integer gender = Integer.valueOf(request.getParameter("gender"));
        Double grade = Double.valueOf(request.getParameter("grade"));

        this.studentService.updateStudent(id, name, dateOfBirth,gender,grade);
        try {
            response.sendRedirect("/student");
        } catch (IOException e) {
            e.printStackTrace();
        }
//                chuyển hướng và url thay đổi theo

//                request.setAttribute("studentListServlet",this.studentService.findAll());
//                request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if(action == null){
            action = "";
        }
        switch (action){
            case "update":
                showFormUpdate(request,response);
                break;
            default:
                showFormCreateNewStudent(request,response);
        }
    }

    private void showFormCreateNewStudent(HttpServletRequest request, HttpServletResponse response) {
        List<Student> students = this.studentService.findAll();
        request.setAttribute("studentListServlet",students);
        try {
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Student student= this.studentService.findById(id);
        request.setAttribute("student", student);
        try {
            request.getRequestDispatcher("update_student.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
