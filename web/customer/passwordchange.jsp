<%-- 
    Document   : passwordchange
    Created on : Jul 20, 2023, 11:55:46 AM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Welcome to Our Cafe</title>
    <!-- Link Bootstrap CSS -->
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="../css/myStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;500&display=swap" rel="stylesheet">
    <style>
        #footer {
            padding: 50px 0 0;
        }

        .footer-info .widget>.title {
            border-bottom: 1px solid;
            color: white;
            line-height: 40px;
            margin-bottom: 10px;
        }

        .footer-info .text {
            display: inline-block;
            color: white;
            width: 100%;
            margin-bottom: 20px;
            position: relative;
        }

        .footer-info .contact-us .fa {
            font-size: 24px;
            margin-right: 10px;
        }

        .footer-info .contact-us p span {
            overflow: hidden;
        }

        .footer-info ul {
            list-style: none;
            margin: 0;
            padding: 0;
            line-height: 26px;
        }

        .fa {
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            font-size: inherit;
            text-rendering: auto;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .footer-info a {
            color: inherit;
        }
        .container{
            width: 50%;
            color: white;
        }
        .container h2{
            text-align: center;
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
            width: 95%;
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
        select{
            width: 95%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            transition: border-color 0.3s;
        }
    </style>
    <!-- Add your custom CSS styles -->
</head>

<body>
    <nav>
        <ul class="navigation-menu">

            <li><a href="./home">Home</a></li>
            <li><a href="./orderFood">Order Food</a></li>
            <li><a href="./history">History</a></li>
            <li><img src="../img/logo.png"></li>
            <li><a href="./feedback">Send Feedback</a></li>
            <li  class="active" class="dropdown">
                <a href="#">Setting</a>
                <ul>
                    <li><a href="./update">Change Information</a></li>
                    <li><a href="./passwordChange">Change Password</a></li>
                </ul>
            </li>

            <li><a href="./logout">Logout</a></li>



        </ul>
    </nav>  
    <div class="container">
        <h2>Change Password</h2>
        <form onsubmit="return validateForm()" action="passwordChange" method="post">
            <div class="form-group">
                <label>Old Password:</label>
                <input type="password" id="old" name="old" >
            </div>
            <div class="form-group">
                <label>New Password:</label>
                <input type="password" id="new" name="new">
            </div>
            <div class="form-group">
                <label>Confirm Password:</label>
                <input type="password" id="cnew" name="cnew">
            </div>
            <input type="submit" value="Update" class="submit-btn"><br>
            <div id="error-message" class="error-message" >${error}</div>
        </form>
    </div>

    <script>
        function validateForm() {
            var old = document.getElementById("old").value;
            var newpass = document.getElementById("new").value;
            var cpass = document.getElementById("cnew").value;
            var errorMessage = document.getElementById("error-message");
            if (old === "" || newpass === "" || cpass === "") {
                errorMessage.innerText = "Please enter all input";
                return false;
            }
            if (newpass !== cpass) {
                errorMessage.innerText = "New password and confirm password is not same";
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
