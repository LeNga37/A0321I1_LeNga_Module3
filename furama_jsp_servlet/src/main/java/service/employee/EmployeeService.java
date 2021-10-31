package service.employee;

import bean.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findAll();
    void creatNewEmployee(Employee employee);
    Employee selectEmployee(int employeeId);
    void editEmployee(Employee employee);
    void deleteEmployee(int employeeId);
    List<Employee> searchEmployeeByName(String employeeName);
}
