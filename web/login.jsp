<%-- 
    Document   : login
    Created on : Jul 11, 2023, 1:16:30 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Coffee Haven Login</title>
        <!-- Add your custom CSS styles here -->
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f7f1e3;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .login-container {
                background-color: #f5e5d1;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
                width: 400px;
            }

            .login-container h2 {
                text-align: center;
                color: #814c27;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
                color: #814c27;
            }

            .form-group input {
                width: 95%;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 16px;
                transition: border-color 0.3s;
            }

            .form-group input:focus {
                border-color: #814c27;
            }

            .submit-btn {
                width: 100%;
                padding: 12px;
                background-color: #814c27;
                color: white;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .submit-btn:hover {
                background-color: #66381a;
            }

            .login-container a {
                display: block;
                text-align: center;
                color: #814c27;
                text-decoration: none;
                margin-top: 10px;
                transition: color 0.3s;
            }

            .login-container a:hover {
                color: #66381a;
            }

            .logo {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 30px;
            }

            .logo img {
                width: 200px;
                height: 200px;
                border-radius: 50%;
                padding: 5px;
            }

            .submit{
                width: 100%
            }


            
        </style>
    </head>
    <body>
        <div class="login-container">
            <div class="logo">
                <img src="img/logo.png" alt="Coffee Haven Logo"/>
            </div>
            <h2>Welcome to Coffee Haven</h2>
            <form id="login-form" action="login" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="username">Username/Phone</label>
                    <input type="text" id="username" name="username"value="${username}" >
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" >              
                </div>
                <div class="submit">
                    <button type="submit" class="submit-btn">Login</button>
                </div>
                <a href = "signUp" target="_blank">Sign up</a>
                <p style="color: red;" id="errorMessage" class="error-message" name="error">${error}</p> 
            </form>
        </div>

        <script>
            function validateForm() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var errorMessage = document.getElementById("errorMessage");

                if (username === "" || password === "") {
                    errorMessage.innerText = "Please enter both username and password.";
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
