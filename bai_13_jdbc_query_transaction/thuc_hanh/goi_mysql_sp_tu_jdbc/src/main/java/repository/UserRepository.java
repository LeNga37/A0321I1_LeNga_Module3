package repository;

import bean.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();
    List<User> searchById(int id);
    void create (User user);
}
