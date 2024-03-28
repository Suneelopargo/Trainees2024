<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup Page</title>
    <!-- Add any necessary CSS or JavaScript files here -->
    <style>
        .success-message {
            color: green;
            font-weight: bold;
        }
        .popup-container {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            justify-content: center;
            align-items: center;
        }

        .popup-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .popup-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #1c92d2;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            text-decoration: none;
            margin-top: 10px;
        }

        .popup-button:hover {
            background-color: #126798;
        }
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
    padding: 20px 20px;
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

       

        .container {
            padding: 40px;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            animation: glow 2s infinite alternate;
            max-width: 400px;
            width: 100%;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
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

        /* Signup form styles */
        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        label {
            color: #333;
            font-weight: bold;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            color: #333;
            outline: none;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #1c92d2;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #126798;
        }

        .success-message {
            color: green;
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
    </nav>
    <div class="container">
        <% if (request.getAttribute("signupSuccess") != null && (boolean)request.getAttribute("signupSuccess")) { %>
            <p class="success-message">Signup successful! Please <a href="login">login</a>.</p>
        <% } else { %>
            <h2>Signup</h2>
            <form action="${pageContext.request.contextPath}/signup" method="post">
                <input type="hidden" id="role" name="role" value="CUSTOMER">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required><br><br>
                <label for="username">Username:</label> 
                <input type="text" id="username" name="username" required><br><br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br><br>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br><br>
                <input type="submit" value="Signup">
            </form>
        <% } %>
        <!-- Signup form -->
    <div class="container2">
        <% if (request.getAttribute("signupSuccess") != null && (boolean)request.getAttribute("signupSuccess")) { %>
            <div class="popup-container" id="successPopup">
                <div class="popup-content">
                    <p>Signup successful!</p>
                    <a href="login" class="popup-button">Back to Login</a>
                </div>
            </div>
        <% } else if (request.getAttribute("signupSuccess") != null && !(boolean)request.getAttribute("signupSuccess")) { %>
            <div class="popup-container" id="failurePopup">
                <div class="popup-content">
                    <p>Signup failed. Please try again.</p>
                    <a href="#" class="popup-button" onclick="closeFailurePopup()">Close</a>
                </div>
            </div>
        <% } %>
    </div>

    </div>
    <!-- JavaScript for handling popups -->
<script>
    // Function to close failure popup
    function closeFailurePopup() {
        document.getElementById('failurePopup').style.display = 'none';
    }

    // Retrieve signup success status from JSP
    var signupSuccess = request.getAttribute("signupSuccess") ;

    // Show popups based on success or failure
    if (signupSuccess) {
        document.getElementById('successPopup').style.display = 'flex';
    } else {
        document.getElementById('failurePopup').style.display = 'flex';
    }
</script>

</body>
</html>
