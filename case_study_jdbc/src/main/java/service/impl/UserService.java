package service.impl;

import model.person.Role;
import model.person.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();

    @Override
    public User findUserByUsername(String usernameRequest) {
        return userRepository.findUserByUsername(usernameRequest);
    }

    @Override
    public Role getRoleFromUser(String username) {
        return userRepository.getRoleFromUser(username);
    }
}
