package service;

import model.person.Role;
import model.person.User;

public interface IUserService {
    User findUserByUsername(String username);
    Role getRoleFromUser(String username);
}
