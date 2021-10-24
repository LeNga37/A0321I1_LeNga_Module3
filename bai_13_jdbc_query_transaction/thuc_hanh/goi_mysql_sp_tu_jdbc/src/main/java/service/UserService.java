package service;

import bean.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    List<User> searchById(int id);
    void create (User user);
}
