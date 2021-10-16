package service;

import entity.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    Customer findById(Integer id);
    void update(Integer id, String name, String email, String address);

    void delete(Integer id);

    void create(Integer id, String name, String email, String address);

    void view(Integer id, String name, String email, String address);
}
