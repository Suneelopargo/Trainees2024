package com.marvel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marvel.dto.LoginRequestDto;
import com.marvel.entity.Users;
import com.marvel.service.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
public class LoginController {

	@Autowired
	UserService userService;
	
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // assuming "login.jsp" is in the "WEB-INF/views" directory
    }
    
    @GetMapping("/signup")
    public String showSignUpPage() {
        return "signup"; 
    }
    
    @PostMapping("/signup")
    public String signUpUser(Users user, Model model) {
        // Add logic to save the user to the database
        // For example:
        userService.addUser(user);
        
        // Set success message to be displayed in sign up page
        model.addAttribute("signupSuccess", true);
        
        // Return signup page with success message
        return "signup";
    }
        
//    @PostMapping("/api/login")
//    public ResponseEntity<Void> login(@RequestBody LoginRequestDto loginRequest) {
//        String username = loginRequest.getUsername();
//        String password = loginRequest.getPassword();
//
//        if (userService.validateCredentials(username, password)) {
//            // If credentials are valid, return HTTP status 200 (OK)
//        	System.out.println("success");
//            return ResponseEntity.ok().build();
//        } else {
//            // If credentials are invalid, return HTTP status 401 (Unauthorized)
//        	System.out.println("Failed");
//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
//        }
//    }
    
    @RequestMapping(value = "/api/login", method = RequestMethod.POST)
    public ResponseEntity<String> login(@RequestBody LoginRequestDto loginRequest, HttpSession session, Model model) {
        String username = loginRequest.getUsername();
        String password = loginRequest.getPassword();
        
        System.out.println(username);
        System.out.println(password);

        if (userService.validateCredentials(username, password)) {
            // If credentials are valid, set the username in the session and redirect to welcome page
        	System.out.println("valid");
            session.setAttribute("username", username);
            return ResponseEntity.ok("/welcome");
        } else {
            // If credentials are invalid, return error message or handle accordingly
            model.addAttribute("error", "Invalid username or password");
            System.out.println("invalid");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("/welcome"); // Assuming login page needs to be shown again
        }
    }




    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String showWelcomePage() {
        return "welcome"; // Assuming "welcome.jsp" is in the "WEB-INF/views" directory
    }


}

