package repository;

import model.person.Role;
import model.person.User;

public interface IUserRepository {
    User findUserByUsername(String usernameRequest);
    Role getRoleFromUser(String username);
}
