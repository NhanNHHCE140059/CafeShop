<%-- 
    Document   : history
    Created on : Jul 17, 2023, 8:20:29 AM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
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

            /* Table Styles */
            table {
                background-color: rgba(0,0,0,0.7);
                width: 100%;
                border-collapse: collapse;
                border-radius: 10px ;
            }

            th, td {
                padding: 10px;
                text-align: left;
                color:white;
            }

            th {

                text-align: center;
            }

            td.center {
                text-align: center;
            }
            td.button{
                text-align: center;
            }

            input.button{
                display: inline-block;
                padding: 12px 30px;
                margin: 20px 0;
                background-color: #ebaa71;
                color: #fff;
                border: none;
                text-decoration: none;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s;
                width:100%

            }


            input.button:hover {
                background-color: #e49958;
                color: #ff3300;
                text-decoration: none;
            }

            button{
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


            button:hover {
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
                <li class="active"><a href="#">History</a></li>
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
        <div class="container">
            <table border="1px">
                <thead>
                    <tr>
                        <th rowspan="2">Date</th>
                        <th rowspan="2">Time</th>
                        <th rowspan="2">Total</th>
                        <th rowspan="2">Address</th>
                        <th colspan="4">Order</th>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>


                </thead>
                <tbody>

                    <c:forEach var="f" items="${requestScope.order}">
                        <c:set var="col" value="${f:length(f.getOrderStatus())+1}"/>
                        <tr> 
                            <td class="center" rowspan="${col}">${f.getDate()}</td>
                            <td class="center" rowspan="${col}">${f.getTime()}</td>
                            <td class="center" rowspan="${col}">$${f.getTotal()}</td>
                             <td class="center" rowspan="${col}">${f.getAddress()}</td>
                            <c:forEach var="fo" items="${f.getOrderStatus()}">
                            <tr>
                                <td>${fo.getName()}</td>
                                <td>$${fo.getPrice()}</td>
                                <td>${fo.getQuantity()}</td>
                                <td>$${fo.getTotal()}</td>
                            </tr>
                        </c:forEach>

                        </tr> 
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </body>
</html>
