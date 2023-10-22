<%-- 
    Document   : order
    Created on : Jul 14, 2023, 6:00:55 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function abc(total) {
                window.location = "saveOrder?total=" + total;
            }
        </script>
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="../css/myStyle.css">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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

            td.type {
                text-align: center;
            }
            td.button{
                text-align: center;
            }

            input.button{
                display: inline-block;
                padding: 3px 9px;
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


            .address{
                color:white;
                margin: 10px 0;
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
                <li class="active"><a href="./orderFood">Order Food</a></li>
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
        <div class="container">
            <form action="saveOrder" method="get">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Unit Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="total" value="0"/>
                        <c:forEach var="f" items="${requestScope.food}">
                            <tr>
                                <td><c:out value = "${f.key.getName()}"></c:out></td>
                                <td><c:out value = "${f.key.getCategory()}"></c:out></td>
                                <td><c:out value = "$ ${f.key.getRealPrice()}"></c:out></td>
                                <td><c:out value = "${f.value}"></c:out></td>
                                <td><c:out value = "$ ${f.key.getRealPrice()*f.value}"></c:out></td>
                                <c:set var="total" value="${total+f.key.getRealPrice()*f.value}"/>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="4">Total</td>
                            <td>$ ${total}</td>
                        </tr>
                    </tbody>
                </table>


                <div class="address">
                    <label>Address (skip it if order in the store): </label>
                    <input type="text" name="address" id="address"/>
                    <input type="button" onclick="order(${total})"value="Order" class="button"/>
                </div>
            </form>  
        </div>

        <script>
            function order(total) {
                var address = document.getElementById("address").value;
                window.location = "saveOrder?total=" + total + "&address=" + address;
            }

        </script>

    </body>
</html>
