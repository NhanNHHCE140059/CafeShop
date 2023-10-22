<%-- 
    Document   : cart
    Created on : Jul 15, 2023, 11:12:11 AM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

            td.type {
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
            input.quantity{
                background-color: rgba(0,0,0,0) ;
                color:white;
            }


            button:hover {
                background-color: #e49958;
                color: #ff3300;
                text-decoration: none;
            }

            a.fas.fa-trash{
                color:white;
            }
            a.fas.fa-trash:hover{
                color: #e49958;
                text-decoration: none;
            }

            td.button{
                text-align: center;
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
            <c:choose>
                <c:when test="${empty food}"><p>You have not order yet</p></c:when>
                <c:otherwise>
                    <form action="payOrder" method="post">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Unit Price</th>
                                    <th>Quantity</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="f" items="${requestScope.food}" varStatus="i">
                                    <tr>
                                <input type="hidden" value="${f.getProduct().getId()}" name="id"/>
                                <td><c:out value = "${f.getProduct().getName()}"></c:out></td>
                                <td><c:out value = "${f.getProduct().getCategory()}"></c:out></td>
                                <td><c:out value = "$ ${f.getProduct().getRealPrice()}"></c:out></td>
                                <td><input class="quantity" type="number" min="1" value="${f.getQuantity()}"name="quantity" ></td>
                                <td class="button"> <a class="fas fa-trash" href="./delete?id=${f.getProduct().getId()}" "> </a></td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>



                        <input class="button" type="submit" value="Order now!"/>
                    </form>  
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
