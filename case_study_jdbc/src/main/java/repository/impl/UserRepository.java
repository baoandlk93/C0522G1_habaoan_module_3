package repository.impl;

import model.person.Customer;
import model.person.Role;
import model.person.User;
import model.person.UserRole;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRepository implements IUserRepository {
    private static final String SELECT_BY_USERNAME = "select * from user u where u.username = ? and u.is_delete = 0";
    private static final String GET_ROLE_FROM_USER = "select * from user u " +
            " join user_role ur on u.username = ur.username" +
            " join role r on r.role_id = ur.role_id" +
            " where u.username = ? and u.is_delete = 0;";

    @Override
    public User findUserByUsername(String usernameRequest) {
        User user = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_USERNAME);
            statement.setString(1, usernameRequest);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                user = new User(username, password);
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public Role getRoleFromUser(String username) {
        Role role = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(GET_ROLE_FROM_USER);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int idRole = resultSet.getInt("role_id");
                String roleName = resultSet.getString("role_name");
                role = new Role(idRole, roleName);
            }
            return role;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return role;
    }
}
