package repository.employee.impl;

import bean.Customer;
import bean.Employee;
import bean.Service;
import repository.DBConnection;
import repository.employee.EmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {
    private static final String SELECT_ALL_EMPLOYEE = "SELECT * FROM furama_resort_1.employee";
    private static final String INSERT_EMPLOYEE = "INSERT INTO `furama_resort_1`.`employee` (`employee_name`, `employee_birthday`, " +
            "`employee_id_card`, `employee_salary`, `employee_phone`, `employee_email`, `employee_address`, `position_id`, " +
            "`education_degree_id`, `division_id`, `username`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM furama_resort_1.employee WHERE employee_id=?";
    private static final String UPDATE_EMPLOYEE_BY_ID = "UPDATE furama_resort_1.employee set employee_name = ?,employee_birthday= ?, " +
            "employee_id_card =?,employee_salary=?,employee_phone=?,employee_email =?,employee_address=?," +
            "position_id=?,education_degree_id=?,division_id=?, username=? WHERE employee_id = ?;";
    private static final String DELETE_EMPLOYEE = "DELETE FROM furama_resort_1.employee WHERE employee_id = ?;";
    private static final String SEARCH_EMPLOYEE_BY_NAME = "SELECT * FROM furama_resort_1.employee WHERE employee_name like ?;";

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int employeeId = resultSet.getInt("employee_id");
                    String employeeName = resultSet.getString("employee_name");
                    String employeeBirthDay = resultSet.getString("employee_birthday");
                    String employeeIdCard = resultSet.getString("employee_id_card");
                    double employeeSalary = resultSet.getDouble("employee_salary");
                    String employeePhone = resultSet.getString("employee_phone");
                    String employeeEmail = resultSet.getString("employee_email");
                    String employeeAddress = resultSet.getString("employee_address");
                    int positionId = resultSet.getInt("position_id");
                    int educationDegreeId = resultSet.getInt("education_degree_id");
                    int divisionId = resultSet.getInt("division_id");
                    String userName = resultSet.getString("username");
                    employeeList.add(new Employee(employeeId, employeeName, employeeBirthDay, employeeIdCard, employeeSalary,
                            employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId, userName));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return employeeList;
    }

    @Override
    public void creatNewEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE);
                preparedStatement.setString(1, employee.getEmployeeName());
                preparedStatement.setString(2, employee.getEmployeeBirthDay());
                preparedStatement.setString(3, employee.getEmployeeIdCard());
                preparedStatement.setDouble(4, employee.getEmployeeSalary());
                preparedStatement.setString(5, employee.getEmployeePhone());
                preparedStatement.setString(6, employee.getEmployeeEmail());
                preparedStatement.setString(7, employee.getEmployeeAddress());
                preparedStatement.setInt(8, employee.getPositionId());
                preparedStatement.setInt(9, employee.getEducationDegreeId());
                preparedStatement.setInt(10, employee.getDivisionId());
                preparedStatement.setString(11, employee.getUserName());
                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }

    @Override
    public Employee selectEmployee(int employeeId) {
        Employee employee = null;
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1, employeeId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployeeId((resultSet.getInt("employee_id")));
                employee.setEmployeeName(resultSet.getString("employee_name"));
                employee.setEmployeeBirthDay(resultSet.getString("employee_birthday"));
                employee.setEmployeeIdCard(resultSet.getString("employee_id_card"));
                employee.setEmployeeSalary((resultSet.getDouble("employee_salary")));
                employee.setEmployeePhone(resultSet.getString("employee_phone"));
                employee.setEmployeeEmail(resultSet.getString("employee_email"));
                employee.setEmployeeAddress(resultSet.getString("employee_address"));
                employee.setPositionId(resultSet.getInt("position_id"));
                employee.setEducationDegreeId(resultSet.getInt("education_degree_id"));
                employee.setDivisionId(resultSet.getInt("division_id"));
                employee.setUserName(resultSet.getString("username"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return employee;
    }

    @Override
    public void editEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        System.out.println(3);
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_BY_ID);
                preparedStatement.setString(1, employee.getEmployeeName());
                preparedStatement.setString(2, employee.getEmployeeBirthDay());
                preparedStatement.setString(3, employee.getEmployeeIdCard());
                preparedStatement.setDouble(4, employee.getEmployeeSalary());
                preparedStatement.setString(5, employee.getEmployeePhone());
                preparedStatement.setString(6, employee.getEmployeeEmail());
                preparedStatement.setString(7, employee.getEmployeeAddress());
                preparedStatement.setInt(8, employee.getPositionId());
                preparedStatement.setInt(9, employee.getEducationDegreeId());
                preparedStatement.setInt(10, employee.getDivisionId());
                preparedStatement.setString(11, employee.getUserName());
                System.out.println(4);
                preparedStatement.setInt(12, employee.getEmployeeId());
                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }

    @Override
    public void deleteEmployee(int employeeId) {
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1, employeeId);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public List<Employee> searchEmployeeByName(String employeeName) {
        List<Employee> employees = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE_BY_NAME);
            preparedStatement.setString(1, "%" + employeeName + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee;
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployeeId((resultSet.getInt("employee_id")));
                employee.setEmployeeName(resultSet.getString("employee_name"));
                employee.setEmployeeBirthDay(resultSet.getString("employee_birthday"));
                employee.setEmployeeIdCard(resultSet.getString("employee_id_card"));
                employee.setEmployeeSalary((resultSet.getDouble("employee_salary")));
                employee.setEmployeePhone(resultSet.getString("employee_phone"));
                employee.setEmployeeEmail(resultSet.getString("employee_email"));
                employee.setEmployeeAddress(resultSet.getString("employee_address"));
                employee.setPositionId(resultSet.getInt("position_id"));
                employee.setEducationDegreeId(resultSet.getInt("education_degree_id"));
                employee.setDivisionId(resultSet.getInt("division_id"));
                employee.setUserName(resultSet.getString("username"));
                employees.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return employees;
    }
}
