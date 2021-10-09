package controller;

import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"","/list","/student"})
public class StudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> studentList = new ArrayList<>();
        studentList.add(new Student(123,"Nguyen Van A","01/01/1990",1,8.0));
        studentList.add(new Student(124,"Nguyen Van B","09/05/1990",0,9.0));
        studentList.add(new Student(125,"Nguyen Van C","12/02/1990",1,4.0));
        studentList.add(new Student(126,"Nguyen Van D","17/03/1990",0,7.5));

        request.setAttribute("studentListServlet",studentList);
        request.getRequestDispatcher("list_by_jstl.jsp").forward(request,response);

    }
}
