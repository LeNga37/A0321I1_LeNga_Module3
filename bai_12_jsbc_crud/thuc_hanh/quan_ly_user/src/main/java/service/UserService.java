package service;

import bean.User;

import java.util.List;

public interface UserService {
    List<User> findAll();

    void create(User user);

    User selectUser(int id);

    void update(User user);

    void delete(int id);
}
