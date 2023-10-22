<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


            button:hover {
                background-color: #e49958;
                color: #ff3300;
                text-decoration: none;
            }
            a.fas.fa-shopping-cart{
                color:white
            }
            a.fas.fa-shopping-cart:hover{
                color: #e49958;
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
            <form action="search" method="post">
                <input name="keyword" type="text" value="<%=request.getParameter("keyword")==null?"":request.getParameter("keyword")%>">
                <button type="submit">Search</button>
            </form>
            <form action="cart" method="get"> 
                <input type="submit" class="button" value="Show Cart">
                <table border="1px">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Sale</th>
                            <th>Description</th>
                            <th>Add to cart</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td class="type" style="font-weight: bold" colspan="5">Food</td></tr>
                        <c:forEach var="product" items="${requestScope.food}" >
                            <tr>
                                <td><c:out value="${product.getName()}"></c:out></td>
                                <td><c:choose>
                                        <c:when test="${product.getSalePercent() == 0 }">
                                            <c:out value="$${product.getPrice()}"></c:out>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="$${product.getRealPrice()}"></c:out>
                                            <del><c:out value="$${product.getPrice()}"></c:out> </del>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><c:out value="${product.getSalePercent()}%"></c:out></td>

                                    <td><c:out value="${product.getDescription()}"></c:out></td>
                                    <td class="button">
                                        <a class="fas fa-shopping-cart" onclick= "addToCart('${product.getId()}')"></a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr><td  class="type" colspan="5"style="font-weight: bold">Dessert</td></tr>
                        <c:forEach var="product" items="${requestScope.dessert}" >
                            <tr>
                                <td><c:out value="${product.getName()}"></c:out></td>
                                <td><c:choose>
                                        <c:when test="${product.getSalePercent() == 0 }">
                                            <c:out value="$${product.getPrice()}"></c:out>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="$${product.getRealPrice()}"></c:out>
                                            <del><c:out value="$${product.getPrice()}"></c:out> </del>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><c:out value="${product.getSalePercent()}%"></c:out></td>
                                <td><c:out value="${product.getDescription()}"></c:out></td>
                                    <td class="button">
                                        <a class="fas fa-shopping-cart" onclick= "addToCart('${product.getId()}')"></a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr><td  class="type" colspan="5" style="font-weight: bold">Beverage</td></tr>
                        <c:forEach var="product" items="${requestScope.beverage}" >
                            <tr>
                                <td><c:out value="${product.getName()}"></c:out></td>
                                <td><c:choose>
                                        <c:when test="${product.getSalePercent() == 0 }">
                                            <c:out value="$${product.getPrice()}"></c:out>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="$${product.getRealPrice()}"></c:out>
                                            <del><c:out value="$${product.getPrice()}"></c:out> </del>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><c:out value="${product.getSalePercent()}%"></c:out></td>
                                <td><c:out value="${product.getDescription()}"></c:out></td>
                                    <td class="button">
                                        <a class="fas fa-shopping-cart" onclick= "addToCart('${product.getId()}')"></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <input type="submit"class="button" value="Show Cart">
            </form>



        </div>
    </body>
</html>
