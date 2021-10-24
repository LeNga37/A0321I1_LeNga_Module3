package service.impl;

import bean.User;
import repository.UserRepository;
import repository.impl.UserRepositoryImpl;
import service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserRepository userRepository = new UserRepositoryImpl();

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public List<User> searchById(int id) {
        return userRepository.searchById(id);
    }

    @Override
    public void create(User user) {
        userRepository.create(user);
    }
}
