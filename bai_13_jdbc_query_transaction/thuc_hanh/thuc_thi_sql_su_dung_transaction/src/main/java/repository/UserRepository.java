package repository;

import bean.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();

    void insertUpdateUseTransaction();

}
