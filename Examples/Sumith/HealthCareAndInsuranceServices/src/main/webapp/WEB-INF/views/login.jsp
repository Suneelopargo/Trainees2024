<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        /* Base styles */
        /* Base styles */
/* Base styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background: linear-gradient(to right, #1c92d2, #f2fcfe);
    overflow: hidden;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #000;
    padding: 10px 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    width: 100%;
}

.logo {
    font-size: 24px;
    color: #00ffff; /* Cyan */
    text-shadow: 0 0 10px #00ffff; /* Glowing effect */
}

.nav-links {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.nav-links li {
    display: inline;
    margin-right: 20px;
}

.nav-links li a {
    text-decoration: none;
    color: #fff;
}

.nav-links li a:hover {
    color: #00ccff; /* Lighter cyan on hover */
}

.container {
    padding: 40px;
    border-radius: 10px;
    background-color: rgba(255, 255, 255, 0.8);
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    animation: glow 2s infinite alternate;
    max-width: 400px;
    width: 100%;
    margin-top: 23%; /* Center horizontally */
    margin-left: 35%;
    position: relative;
    top: 50%; /* Move 50% from the top */
    transform: translateY(-50%); /* Move back up by 50% of its own height */
}

@keyframes glow {
    from { box-shadow: 0 0 20px rgba(0, 0, 0, 0.2); }
    to { box-shadow: 0 0 40px rgba(0, 0, 0, 0.4); }
}

h2 {
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

/* Login form styles */
form {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

label {
    color: #333;
    font-weight: bold;
}

input[type="text"], input[type="password"] {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
    color: #333;
    outline: none;
}

input[type="button"] {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    background-color: #1c92d2;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
}

input[type="button"]:hover {
    background-color: #126798;
}

#errorMessage {
    color: red;
    font-weight: bold;
    text-align: center;
}

/* Sign up link styles */
p {
    text-align: center;
}

a {
    color: #1c92d2;
    text-decoration: none;
    transition: color 0.2s ease-in-out;
}

a:hover {
    color: #126798;
}

    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">Marvel Services</div>
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
    <div class="container">
        <h2>Login</h2>
        <form action="/api/login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="button" value="Login" onclick="validateLogin();">
            <div id="errorMessage"></div>
        </form>
        <p>New user? <a href="signup">Sign up here</a></p>
    </div>

    <script>
        function login() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
    
        // Perform basic client-side validation
        if (!username || !password) {
            document.getElementById("errorMessage").innerText = "Please enter both username and password.";
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }
    
    function validateLogin() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    
    // Make AJAX call to validate login
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                // Redirect to the welcome page
                window.location.href = "/welcome";
            } else if (xhr.status === 401) {
                // If login failed, display error message
                document.getElementById("errorMessage").innerText = "Invalid username or password.";
            }
        }
    };
    xhr.open("POST", "/api/login", true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.send(JSON.stringify({ username: username, password: password }));
    }
    
    
    </script>
</body>
</html>

