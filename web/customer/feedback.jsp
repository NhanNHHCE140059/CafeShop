<%-- 
    Document   : feedback
    Created on : Jul 16, 2023, 8:25:54 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="../css/myStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <head>
        <title>Welcome to Our Cafe</title>
        <style>

            label{
                color:white;
            }
            .type{
                border-radius: 5px
            }

            .content{
                width: 100%;
                height: 200px;
                border-radius: 5px
            }

          
            input.button{
                display: inline-block;
                padding: 2px 9px;
                margin: 20px 0;
                background-color: #ebaa71;
                color: #fff;
                border: none;
                text-decoration: none;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s;

            }


          input.button:hover {
                background-color: #e49958;
                color: #ff3300;
                text-decoration: none;
            }

        </style>


        <script>
            function addToCart(id) {
                window.location = "addToCart?id=" + id;
            }
        </script>

    </head>
    <body>
        <nav>
            <ul class="navigation-menu">

                <li><a href="./home">Home</a></li>
                <li><a href="./orderFood">Order Food</a></li>
                <li><a href="./history">History</a></li>
                <li><img src="../img/logo.png"></li>
                <li class="active"><a href="#">Send Feedback</a></li>
                <li class="dropdown">
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
             <form action="feedback" method="post">
            <label>Type:</label> <select name="type" class="type">
                <option value="Food">Food/Drink feedback</option>  
                <option value="Employee">Employee feedback</option>  
                <option value="Other">Other</option>  
            </select> <br>
            <label>Comment:</label> <textarea type ="text" name="content" class="content" placeholder="This food is so good"></textarea><br>
            <input type="submit" class="button" value="Send feedback">
            </form>
        </div>
    </body>
</html>
