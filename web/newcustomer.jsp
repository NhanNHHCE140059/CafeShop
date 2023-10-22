<%-- 
    Document   : newcustomer
    Created on : Jul 18, 2023, 12:16:35 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            select{
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 16px;
                transition: border-color 0.3s;
            }

            .form-group input:focus,form-group select:focus{
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

            .error-message{
                margin-top: 10px;
                color: red;
            }


        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Sign up</h2>
            <form onsubmit="return validateForm()" action="signUp" method="post">
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" value="<%=request.getParameter("phone")==null?"":request.getParameter("phone")%>">

                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%=request.getParameter("name")==null?"":request.getParameter("name")%>">

                </div>
                <div class="form-group">
                    <label for="dob">Date of Birth</label>
                    <input type="date" id="dob" name="dob" value="<%=request.getParameter("dob")==null?"":request.getParameter("dob")%>">
                </div>
                <div class="form-group">
                    <label for="sex">Sex</label>
                    <select name = "sex">
                        <option value ="Male" checked>Male</option>
                        <option value ="Female">Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password">
                </div>
                <div class="form-group">
                    <label for="password">Confirm Password:</label>
                    <input type="password" id="cpassword" name="cpassword">
                </div>
                <input type="submit" value="Sign in" class="submit-btn ">
                <div id="error-message" class="error-message"  >${error}</div>
            </form>
        </div>
    </body>

    <script>
        function validateForm() {
            var phone = document.getElementById("phone").value;
            var password = document.getElementById("password").value;
            var cpassword = document.getElementById("cpassword").value;
            var name = document.getElementById("name").value;
            var dob = document.getElementById("dob").value;
            var errorMessage = document.getElementById("error-message");
            const regex = /^\d{10}$/;

            if (phone === "" || password === "" || name === "" || dob === "") {
                errorMessage.innerText = "Please enter all input.";
                return false;
            }
            if (password !== cpassword) {
                errorMessage.innerText = "Confirm password and password is not same.";
                return false;
            }
            if (!regex.test(phone)) {
                errorMessage.innerText = "Phone number is invalid.";
                return false;
            }
            return true;
        }
    </script>
</html>
