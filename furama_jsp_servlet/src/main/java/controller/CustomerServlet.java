package controller;

import bean.Customer;
import service.customer.CustomerService;
import service.customer.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/furama/customer")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        switch (action) {
            case "create":
                createNewCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            case "search":
                searchCustomerByName(request,response);
                break;
        }
    }

    private void searchCustomerByName(HttpServletRequest request, HttpServletResponse response) {
        String customerName = request.getParameter("searchName");
        List<Customer> customerList = customerService.searchCustomerByName(customerName);
        request.setAttribute("customerList",customerList);
        try {
            request.getRequestDispatcher("/furama/customer/list_customer.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("customerId"));
        customerService.deleteCustomer(id);
        try {
            response.sendRedirect("/furama/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerAddress = request.getParameter("customerAddress");
        Customer customer = new Customer(customerName, customerBirthday, customerGender, customerIdCard, customerPhone,
                customerEmail, customerTypeId, customerAddress);
        customer.setCustomerId(customerId);
        customer.setCustomerName(customerName);
        customer.setCustomerBirthday(customerBirthday);
        customer.setCustomerGender(customerGender);
        customer.setCustomerIdCard(customerIdCard);
        customer.setCustomerPhone(customerPhone);
        customer.setCustomerEmail(customerEmail);
        customer.setCustomerTypeId(customerTypeId);
        customer.setCustomerAddress(customerAddress);
        customerService.editCustomer(customer);
        try {
            response.sendRedirect("/furama/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        int customerGender = Integer.parseInt(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerAddress = request.getParameter("customerAddress");
        Customer customer = new Customer(customerName, customerBirthday, customerGender, customerIdCard, customerPhone,
                customerEmail, customerTypeId, customerAddress);
        customerService.createNewCustomer(customer);
        try {
            response.sendRedirect("/furama/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreateNewCustomer(request, response);
                break;
            case "edit":
                showFormEditCustomer(request, response);
                break;
//            case "search":
//                searchCustomerByName(request,response);
//                break;
            default:
                showCustomerList(request, response);
                break;
        }
    }


    private void showFormEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        Customer customer = customerService.selectCustomerById(customerId);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("/furama/customer/edit_customer.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreateNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/furama/customer/create_customer.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        try {
            request.getRequestDispatcher("/furama/customer/list_customer.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
