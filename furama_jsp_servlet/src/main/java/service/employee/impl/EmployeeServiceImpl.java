package service.employee.impl;

import bean.Employee;
import repository.employee.EmployeeRepository;
import repository.employee.impl.EmployeeRepositoryImpl;
import service.employee.EmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();
    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public void creatNewEmployee(Employee employee) {
        employeeRepository.creatNewEmployee(employee);
    }

    @Override
    public Employee selectEmployee(int employeeId) {
        return employeeRepository.selectEmployee(employeeId);
    }

    @Override
    public void editEmployee(Employee employee) {
        employeeRepository.editEmployee(employee);
    }

    @Override
    public void deleteEmployee(int employeeId) {
        employeeRepository.deleteEmployee(employeeId);
    }

    @Override
    public List<Employee> searchEmployeeByName(String employeeName) {
        return employeeRepository.searchEmployeeByName(employeeName);
    }
}
