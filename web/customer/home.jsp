<%-- 
    Document   : home
    Created on : Jul 14, 2023, 11:07:05 AM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

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
        </style>
        <!-- Add your custom CSS styles -->
    </head>

    <body>
        <nav>
            <ul class="navigation-menu">

                <li class="active"><a href="#">Home</a></li>
                <li><a href="./orderFood">Order Food</a></li>
                <li><a href="./history">History</a></li>
                <li><img src="../img/logo.png"></li>
                <li><a href="./feedback">Send Feedback</a></li>
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
        <div class="container-fluid text-center" style="width: 100%;">
            <h1>Welcome to Our Cafe, ${name}!</h1>
            <img style="display: inline-block; width: 100%;" src="../img/nen.jpg">
            <p>At Coffee Haven, we believe that every cup of coffee should be an exquisite experience. We serve only the finest,
                hand-selected coffee beans, expertly roasted to perfection, and brewed with love. Our baristas are passionate
                about their craft, ensuring every cup is a masterpiece.</p>
            <a style="display: inline-block;" href="./orderFood" class="cta-button">Order Food now!</a>
        </div>



        <footer id="footer">
            <div class="footer-info">
                <div class="container-fluid">
                    <aside class="widget aboutus" style=" float: left; width:20%">
                        <h3 class="title">
                            <span class="value">ABOUT US</span>
                        </h3>
                        <div class="widget-content contact-us">
                            <div class="text">
                                <i class="fa">&#xf0e0;</i><span class="value">youremail@gmail.com</span>
                            </div>
                            <div class="text">
                                <i class="fa">&#xf095;</i><span class="value">+(84)123456789</span>
                            </div>
                            <div class="text">
                                <i class="fa">&#xf015;</i><span class="value">198 your shop address</span>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </footer>

        <!-- Link Bootstrap JS -->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>