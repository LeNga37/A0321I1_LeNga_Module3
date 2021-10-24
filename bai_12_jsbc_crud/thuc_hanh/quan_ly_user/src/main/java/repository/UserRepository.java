package repository;

import bean.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();
    void create(User user);
    User selectUser(int id);
    void update(User user);
    void delete(int id);
}
