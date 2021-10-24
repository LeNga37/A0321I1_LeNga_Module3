package controller;

import bean.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"", "/user"})
public class UserServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
//            case "create":
//                createUser(request,response);
//                break;
            case "edit":
                updateUser(request,response);
                break;
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);
        userService.update(user);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    private void createUser(HttpServletRequest request, HttpServletResponse response) {
//        String name = request.getParameter("name");
//        String email = request.getParameter("email");
//        String country = request.getParameter("country");
//        User user = new User(name, email, country);
//        userService.create(user);
//        try {
//            response.sendRedirect("/user");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
//            case "search":
//                searchById(request, response);
//                break;
            case "edit":
                showFormCeateNewUser(request,response);
                break;
            case "update":
                showFormUpdateUser(request,response);
                break;
            case "delete":
                deleteUser(request,response);
                break;
            default:
                showUserList(request, response);
                break;
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        request.setAttribute("user",user);
        userService.delete(id);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormUpdateUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/user/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCeateNewUser(HttpServletRequest request, HttpServletResponse response) {try {
        request.getRequestDispatcher("/user/create.jsp").forward(request, response);
    } catch (ServletException | IOException e) {
        e.printStackTrace();
    }
    }

//    private void searchById(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("searchId"));
//        List<User> searchById = this.userService.searchById(id);
//        request.setAttribute("userList", searchById);
//        try {
//            request.getRequestDispatcher("/user/list.jsp").forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }
//    }

    private void showUserList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.findAll();
        request.setAttribute("userList", userList);
        try {
            request.getRequestDispatcher("/user/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
