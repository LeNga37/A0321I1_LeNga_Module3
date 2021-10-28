package repository.customer.impl;

import bean.Customer;
import bean.User;
import repository.DBConnection;
import repository.customer.CustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "SELECT * FROM furama_resort_1.customer";
    private static final String INSERT_CUSTOMER = "INSERT INTO `furama_resort_1`.`customer` (`customer_name`, " +
            "`customer_birthday`, `customer_gender`, `customer_id_card`, `customer_phone`, `customer_email`, " +
            "`customer_type_id`, `customer_address`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT * FROM furama_resort_1.customer WHERE customer_id=?";
    private static final String UPDATE_CUSTOMER_BY_ID = "UPDATE furama_resort_1.customer set customer_name = ?,customer_birthday= ?, " +
            "customer_gender =?,customer_id_card=?,customer_phone=?,customer_email =?,customer_type_id=?," +
            "customer_address=?, WHERE customer_id = ?;";
    private static final String DELETE_CUSTOMER = "DELETE FROM furama_resort_1.customer WHERE customer_id = ?;";
    private static final String SEARCH_USERS_BY_NAME = "SELECT * FROM furama_resort_1.customer WHERE customer_name like ?;";




    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int customerId = resultSet.getInt("customer_id");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    String customerName = resultSet.getString("customer_name");
                    String customerBirthday = resultSet.getString("customer_birthday");
                    int customerGender = resultSet.getInt("customer_gender");
                    String customerIdCard = resultSet.getString("customer_id_card");
                    String customerPhone = resultSet.getString("customer_phone");
                    String customerEmail = resultSet.getString("customer_email");
                    String customerAddress = resultSet.getString("customer_address");
                    customerList.add(new Customer(customerId, customerTypeId, customerName, customerBirthday, customerGender,
                            customerIdCard, customerPhone, customerEmail, customerAddress));
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
        return customerList;
    }

    @Override
    public void createNewCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
                preparedStatement.setString(1, customer.getCustomerName());
                preparedStatement.setString(2, customer.getCustomerBirthday());
                preparedStatement.setInt(3, customer.getCustomerGender());
                preparedStatement.setString(4, customer.getCustomerIdCard());
                preparedStatement.setString(5, customer.getCustomerPhone());
                preparedStatement.setString(6, customer.getCustomerEmail());
                preparedStatement.setInt(7, customer.getCustomerTypeId());
                preparedStatement.setString(8, customer.getCustomerAddress());
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
    public Customer selectCustomerById(int customerId) {
        Customer customer = null;
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, customerId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerId((resultSet.getInt("customer_id")));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customer.setCustomerBirthday(resultSet.getString("customer_birthday"));
                customer.setCustomerGender(resultSet.getInt("customer_gender"));
                customer.setCustomerIdCard((resultSet.getString("customer_id_card")));
                customer.setCustomerPhone(resultSet.getString("customer_phone"));
                customer.setCustomerEmail(resultSet.getString("customer_email"));
                customer.setCustomerTypeId(resultSet.getInt("customer_type_id"));
                customer.setCustomerAddress(resultSet.getString("customer_address"));
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
        return customer;
    }

    @Override
    public void editCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_BY_ID);
                preparedStatement.setString(1, customer.getCustomerName());
                preparedStatement.setString(2, customer.getCustomerBirthday());
                preparedStatement.setInt(3, customer.getCustomerGender());
                preparedStatement.setString(4, customer.getCustomerIdCard());
                preparedStatement.setString(5, customer.getCustomerPhone());
                preparedStatement.setString(6, customer.getCustomerEmail());
                preparedStatement.setInt(7, customer.getCustomerTypeId());
                preparedStatement.setString(8, customer.getCustomerAddress());
                preparedStatement.setInt(9, customer.getCustomerId());
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
    public void deleteCustomer(int customerId) {
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1, customerId);
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
    public List<Customer> searchCustomerByName(String customerName) {
        List<Customer> customers = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SEARCH_USERS_BY_NAME);
            preparedStatement.setString(1,"%"+customerName+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()){
                customer=new Customer();
                customer.setCustomerId((resultSet.getInt("customer_id")));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customer.setCustomerBirthday(resultSet.getString("customer_birthday"));
                customer.setCustomerGender(resultSet.getInt("customer_gender"));
                customer.setCustomerIdCard((resultSet.getString("customer_id_card")));
                customer.setCustomerPhone(resultSet.getString("customer_phone"));
                customer.setCustomerEmail(resultSet.getString("customer_email"));
                customer.setCustomerTypeId(resultSet.getInt("customer_type_id"));
                customer.setCustomerAddress(resultSet.getString("customer_address"));
                customers.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return customers;
    }
}