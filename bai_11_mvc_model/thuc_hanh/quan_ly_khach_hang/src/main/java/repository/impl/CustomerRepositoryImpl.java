package repository.impl;

import entity.Customer;
import repository.CustomerRepository;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer(11, "John", "john@codegym.vn", "Hanoi"));
        customerList.add(new Customer(22, "Bill", "bill@codegym.vn", "Danang"));
        customerList.add(new Customer(33, "Alex", "alex@codegym.vn", "Saigon"));
        customerList.add(new Customer(44, "Adam", "adam@codegym.vn", "Beijin"));
        customerList.add(new Customer(55, "Sophia", "sophia@codegym.vn", "Miami"));
        customerList.add(new Customer(66, "Rose", "rose@codegym.vn", "Newyork"));
    }

    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public Customer findById(Integer id) {
        for(Customer customer : customerList){
            if(customer.getId().equals(id)){
                return customer;
            }
        }
        return null;
    }

    @Override
    public void updateCustomer(Integer id, String name, String email, String address) {
        for(Customer customer : customerList){
            if(customer.getId().equals(id)){
                customer.setName(name);
                customer.setEmail(email);
                customer.setAddress(address);
            }
        }
    }

    @Override
    public void deleteCustomer(Integer id) {
        for(Customer customer : customerList){
            if(customer.getId().equals(id)){
                customerList.remove(customer);
                break;
            }
        }
    }

    @Override
    public void createCustomer(Integer new_id, String name, String email, String address) {
        Customer customer = new Customer();
        customer.setId(new_id);
        customer.setName(name);
        customer.setEmail(email);
        customer.setAddress(address);
        customerList.add( customer);
    }

    @Override
    public void viewCustomer(Integer id, String name, String email, String address) {
        for(Customer customer : customerList){
            if(customer.getId().equals(id)){
                customer.setName(name);
                customer.setEmail(email);
                customer.setAddress(address);
            }
        }
    }
}
