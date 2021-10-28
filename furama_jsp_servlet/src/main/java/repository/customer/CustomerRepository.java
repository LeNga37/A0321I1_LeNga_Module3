package repository.customer;

import bean.Customer;

import java.util.List;

public interface CustomerRepository {
    List<Customer> findAll();
    void createNewCustomer(Customer customer);
    Customer selectCustomerById(int customerId);
    void editCustomer(Customer customer);
    void deleteCustomer(int customerId);
    List<Customer> searchCustomerByName(String customerName);
}
