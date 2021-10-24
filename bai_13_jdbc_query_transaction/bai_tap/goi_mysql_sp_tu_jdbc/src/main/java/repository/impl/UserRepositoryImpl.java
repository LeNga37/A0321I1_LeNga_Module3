package repository.impl;

import bean.User;
import jdk.nashorn.internal.codegen.CompilerConstants;
import repository.DBConnection;
import repository.UserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {
    private static final String SELECT_ALL_USER = "call find_all_user";
    private static final String SEARCH_BY_ID = "call get_user_by_id(?)";
    private static final String INSERT_USER = "call insert_user(?,?,?)";
    private static final String UPDATE_BY_ID = "call update_user(?,?,?,?)";
    private static final String DELETE_USER = "call delete_user(?)";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM user WHERE id=?";

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        try {
            CallableStatement callableStatement = DBConnection.getConnection().prepareCall(SELECT_ALL_USER);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

//    @Override
//    public List<User> searchById(int id) {
//        List<User> userList = new ArrayList<>();
//        try {
//            CallableStatement callableStatement = DBConnection.getConnection().prepareCall(SEARCH_BY_ID);
//            callableStatement.setInt(1, id);
//            ResultSet resultSet = callableStatement.executeQuery();
//            User user;
//            while (resultSet.next()) {
//                String name = resultSet.getString("name");
//                String email = resultSet.getString("email");
//                String country = resultSet.getString("country");
//                user = new User(id, name, email, country);
//                userList.add(user);
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return userList;
//    }

//    @Override
//    public void create(User user) {
//        try {
//            CallableStatement callableStatement = DBConnection.getConnection().prepareCall(INSERT_USER);
//            callableStatement.setString(1, user.getName());
//            callableStatement.setString(2, user.getEmail());
//            callableStatement.setString(3, user.getCountry());
//            callableStatement.executeQuery();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//    }

    @Override
    public void update(User user) {
        try {
            CallableStatement callableStatement = DBConnection.getConnection().prepareCall(UPDATE_BY_ID);
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            callableStatement.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user = new User();
                user.setId((resultSet.getInt("id")));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public void delete(int id) {
        try {
            CallableStatement callableStatement = DBConnection.getConnection().prepareCall(DELETE_USER);
            callableStatement.setInt(1, id);
            callableStatement.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
