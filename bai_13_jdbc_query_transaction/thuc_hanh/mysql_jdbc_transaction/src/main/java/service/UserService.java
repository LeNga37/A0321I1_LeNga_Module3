package service;

import bean.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    void addUserTransaction(User user, int[] permision);
}
