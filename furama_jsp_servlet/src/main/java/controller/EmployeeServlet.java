package controller;

import bean.Customer;
import bean.Employee;
import bean.Service;
import service.employee.EmployeeService;
import service.employee.impl.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/furama/employee")
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService = new EmployeeServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String employeeName = request.getParameter("searchName");
        System.out.println(employeeName);
        List<Employee> employeeList = employeeService.searchEmployeeByName(employeeName);
        request.setAttribute("employeeList",employeeList);
        try {
            request.getRequestDispatcher("/furama/employee/list_employee.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        employeeService.deleteEmployee(employeeId);
        try {
            response.sendRedirect("/furama/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(5);
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        String employeeName = request.getParameter("employeeName");
        String employeeBirthDay = request.getParameter("employeeBirthDay");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        System.out.println(userName);
        Employee employee = new Employee(employeeName, employeeBirthDay, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress,positionId,educationDegreeId,divisionId,userName);
        employee.setEmployeeId(employeeId);
        employee.setEmployeeName(employeeName);
        employee.setEmployeeBirthDay(employeeBirthDay);
        employee.setEmployeeIdCard(employeeIdCard);
        employee.setEmployeeSalary(employeeSalary);
        employee.setEmployeePhone(employeePhone);
        employee.setEmployeeEmail(employeeEmail);
        employee.setEmployeeAddress(employeeAddress);
        employee.setPositionId(positionId);
        employee.setEducationDegreeId(educationDegreeId);
        employee.setDivisionId(divisionId);
        employee.setUserName(userName);
        employeeService.editEmployee(employee);
        System.out.println(7);
        try {
            response.sendRedirect("/furama/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        String employeeName = request.getParameter("employeeName");
        String employeeBirthDay = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        Employee employee = new Employee(employeeName, employeeBirthDay, employeeIdCard, employeeSalary, employeePhone,
                employeeEmail, employeeAddress, positionId,educationDegreeId,divisionId,userName);
        employeeService.creatNewEmployee(employee);
        try {
            response.sendRedirect("/furama/employee");
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
                showFormCreateNewEmployee(request, response);
                break;
            case "edit":
                showFormEditEmployee(request, response);
                break;
            default:
                showEmployeeList(request, response);
                break;
        }
    }

    private void showFormEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        Employee employee = employeeService.selectEmployee(employeeId);
        request.setAttribute("employee", employee);
        try {
            request.getRequestDispatcher("/furama/employee/edit_employee.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreateNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/furama/employee/create_employee.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.findAll();
        request.setAttribute("employeeList", employeeList);
        try {
            request.getRequestDispatcher("/furama/employee/list_employee.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
