package repository;

import bean.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();
    public void addUserTransaction(User user, int[] permision);
}
