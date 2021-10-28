package service.customer;

import bean.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    void createNewCustomer(Customer customer);
    Customer selectCustomerById(int customerId);
    void editCustomer(Customer customer);
    void deleteCustomer(int customerId);
    List<Customer> searchCustomerByName(String customerName);


}
