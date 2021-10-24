package repository.impl;

import bean.User;
import repository.DBConnection;
import repository.UserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {
    private static final String SELECT_ALL_USER = "SELECT * FROM users.users";
    private static final String INSERT_USERS_SQL = "INSERT INTO `users`.`users` (`name`, " +
            "`email`, `country`) VALUES (?, ?, ?);";
    private static final String INSERT_USERS_PERMISION = "INSERT INTO user_permision(user_id,permision_id) "
            + "VALUES(?,?)";



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
    public void addUserTransaction(User user, int[] permision) {
        Connection connection = null;
        // for insert a new user
        PreparedStatement preparedStatement = null;
        // for assign permision to user
        PreparedStatement pstmtAssignment = null;
        // for getting user id
        ResultSet resultSet = null;
        try {
            connection = DBConnection.getConnection();
            // set auto commit to false
            connection.setAutoCommit(false);
            // Insert user
            preparedStatement = connection.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int rowAffected = preparedStatement.executeUpdate();
            // get user id
            resultSet = preparedStatement.getGeneratedKeys();
            int userId = 0;
            if (resultSet.next())
                userId = resultSet.getInt(1);
            // in case the insert operation successes, assign permision to user
            if (rowAffected == 1) {
                // assign permision to user
                pstmtAssignment = connection.prepareStatement(INSERT_USERS_PERMISION);
                for (int permisionId : permision) {
                    pstmtAssignment.setInt(1, userId);
                    pstmtAssignment.setInt(2, permisionId);
                    pstmtAssignment.executeUpdate();
                }
                connection.commit();
            } else {
                connection.rollback();
            }
        } catch (SQLException ex) {
            // roll back the transaction
            try {
                if (connection != null)
                    connection.rollback();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (pstmtAssignment != null) pstmtAssignment.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }
}
