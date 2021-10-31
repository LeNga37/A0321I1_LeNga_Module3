package repository.employee;

import bean.Customer;
import bean.Employee;
import bean.Service;

import java.util.List;

public interface EmployeeRepository {
    List<Employee> findAll();
    void creatNewEmployee(Employee employee);
    Employee selectEmployee(int employeeId);
    void editEmployee(Employee employee);
    void deleteEmployee(int employeeId);
    List<Employee> searchEmployeeByName(String employeeName);
}
