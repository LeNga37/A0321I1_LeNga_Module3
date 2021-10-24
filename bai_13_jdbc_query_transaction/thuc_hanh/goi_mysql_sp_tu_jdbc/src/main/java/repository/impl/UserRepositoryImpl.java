package repository.impl;

import bean.User;
import repository.DBConnection;
import repository.UserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {
    private static final String SELECT_ALL_USER = "SELECT * FROM users.users";
    private static final String SEARCH_BY_ID = "call get_user_by_id(?)";
    private static final String INSERT_USER = "call insert_user(?,?,?)";

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    userList.add(new User(id, name, email, country));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return userList;
    }

    @Override
    public List<User> searchById(int id) {
        List<User> userList = new ArrayList<>();
        try {
            CallableStatement callableStatement = DBConnection.getConnection().prepareCall(SEARCH_BY_ID);
            callableStatement.setInt(1,id);
            ResultSet resultSet = callableStatement.executeQuery();
            User user;
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public void create(User user) {
        try {
            CallableStatement callableStatement = DBConnection.getConnection().prepareCall(INSERT_USER);
            callableStatement.setString(1,user.getName());
            callableStatement.setString(2,user.getEmail());
            callableStatement.setString(3,user.getCountry());
            callableStatement.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
