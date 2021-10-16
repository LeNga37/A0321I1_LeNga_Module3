package service.impl;

import entity.Customer;
import repository.CustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    private CustomerRepository customerRepository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> findAll() {
        List<Customer> customers =customerRepository.findAll();
        return customers;
//        return customerRepository.findAll();
    }

    @Override
    public Customer findById(Integer id) {
        Customer customer=this.customerRepository.findById(id);
        return customer;
    }


    @Override
    public void update(Integer id, String name, String email, String address) {
        if(name.equals("")){
            System.out.println("Tên không được để trống");
            return;
        }
        if(email.equals("")){
            System.out.println("Email không được để trống");
            return;
        }
        if(address.equals("")){
            System.out.println("Địa chỉ không được để trống");
            return;
        }
        if(this.customerRepository.findById(id)==null){
            System.out.println("Id không tồn tại trong list");
            return;
        }
        this.customerRepository.updateCustomer(id,name,email,address);
    }

    @Override
    public void delete(Integer id) {
        if(this.customerRepository.findById(id) == null){
            System.out.println("Id không tồn tại trong list");
            return;
        }
        this.customerRepository.deleteCustomer(id);
    }

    @Override
    public void create(Integer id, String name, String email, String address) {
        this.customerRepository.createCustomer(id,name,email,address);
    }

    @Override
    public void view(Integer id, String name, String email, String address) {
        this.customerRepository.viewCustomer(id,name,email,address);
    }
}
