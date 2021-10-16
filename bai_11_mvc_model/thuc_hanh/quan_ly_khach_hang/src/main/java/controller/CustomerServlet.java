package controller;

import entity.Customer;
import service.CustomerService;
import service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"","/customer"})
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "update":
                Integer id= Integer.valueOf(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                this.customerService.update(id,name,email,address);
                response.sendRedirect("/customer");
//                request.setAttribute("customerListServlet",this.customerService.findAll());
//                request.getRequestDispatcher("list.jsp").forward(request,response);
                break;
            case "delete":
                id= Integer.valueOf(request.getParameter("id"));
                this.customerService.delete(id);
                response.sendRedirect("/customer");
                break;
            case "create":
                id= Integer.valueOf(request.getParameter("id"));
                name = request.getParameter("name");
                email = request.getParameter("email");
                address = request.getParameter("address");
                this.customerService.create(id,name,email,address);
                response.sendRedirect("/customer");
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                request.getRequestDispatcher("create.jsp").forward(request,response);
            case "update":
                Integer id= Integer.valueOf(request.getParameter("id"));
                Customer customer = this.customerService.findById(id);
                request.setAttribute("customer",customer);
                request.getRequestDispatcher("edit.jsp").forward(request,response);
                break;
            case "delete":
                id= Integer.valueOf(request.getParameter("id"));
                customer = this.customerService.findById(id);
                request.setAttribute("customer",customer);
                request.getRequestDispatcher("delete.jsp").forward(request,response);
                break;
            case "detail":
                id= Integer.valueOf(request.getParameter("id"));
                customer = this.customerService.findById(id);
                request.setAttribute("customer",customer);
                request.getRequestDispatcher("view.jsp").forward(request,response);
                break;
            default:
                List<Customer> customers= this.customerService.findAll();
                request.setAttribute("customerListServlet",customers);
                request.getRequestDispatcher("list.jsp").forward(request,response);
                break;
        }

    }
}
