package com.marvel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marvel.entity.Users;
import com.marvel.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // Create operation
    public Users addUser(Users user) {
        return userRepository.save(user);
    }

    // Read operation
    public List<Users> getAllUsers() {
        return userRepository.findAll();
    }

    public Optional<Users> getUserById(Integer id) {
        return userRepository.findById(id);
    }

    // Update operation
    public Users updateUser(Integer id, Users updatedUser) {
        Optional<Users> userOptional = userRepository.findById(id);
        if (userOptional.isPresent()) {
            Users user = userOptional.get();
            // Update only if the fields are not null
            if (updatedUser.getFirstName() != null) {
                user.setFirstName(updatedUser.getFirstName());
            }
            if (updatedUser.getUsername() != null) {
                user.setUsername(updatedUser.getUsername());
            }
            if (updatedUser.getPassword() != null) {
                user.setPassword(updatedUser.getPassword());
            }
            if (updatedUser.getRole() != null) {
                user.setRole(updatedUser.getRole());
            }
            if (updatedUser.getEmail() != null) {
                user.setEmail(updatedUser.getEmail());
            }
            user.setActive(updatedUser.isActive());
            return userRepository.save(user);
        } else {
            throw new IllegalArgumentException("User not found with id: " + id);
        }
    }

    // Delete operation
    public void deleteUser(Integer id) {
        userRepository.deleteById(id);
    }
    
    public boolean validateCredentials(String username, String password) {
        // Retrieve the user by username from the database
        Users user = userRepository.findByUsername(username);
        
        // Check if the user exists and if the provided password matches the user's password
        return user != null && user.getPassword().equals(password);
    }

	
	
}

