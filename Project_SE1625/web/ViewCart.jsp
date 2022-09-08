<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro - Shop</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <script src="js/quickView.js" defer></script>
        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>  
        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>List Cart</b</h2>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>

                                <th>ID</th>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Category</th>
                                <th>Brand</th>
                                <th>Description</th>
                                <th>Old Price</th>
                                <th>Image</th>
                                <th>Color</th>
                                <th>Size</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pList}" var="i" begin="${CP.begin}" end="${CP.end}">
                            <tr>

                                <td>${i.getID()}</td>
                                <td>${i.getName()}</td>
                                <td>${i.getQuantity()}</td>
                                <td>$${i.getPrice()}</td>
                                <c:forEach items="${cList}" var="o">
                                    <c:if test="${i.getCategoryID() == o.getID()}">
                                        <td>${o.getName()}</td>
                                    </c:if>
                                </c:forEach>
                                <td>${i.getBrand()}</td>
                                <td>${i.getDescription()}</td>
                                <td>${i. getOldPrice()}</td>

                                <td><img width="200px"
                                         height= "200px" src="./Product_Image/${i.getImage()}" alt"/></td>
                                <td>${i.getColor()}</td>
                                <td>${i.getSize()}</td>
                                <td>
                                    <a href="EditProduct?type=1&id=${i.getID()}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="EditProduct?type=0&id=${i.getID()}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">

                    <div>
                        <form action="EditProduct" method="get">
                            <c:if test="${CP.cp!=0}">
                                <input type="submit" name = "Home" value = "Home">
                                <input type="submit" name = "Pre" value = "Pre">
                            </c:if>
                            <c:forEach begin="${CP.pageStart}" end="${CP.pageEnd}" var="i">
                                <span><input type="submit" name = "btn${i}" value = "${i+1}"></span>
                                </c:forEach>
                                <c:if test="${CP.cp!=CP.np-1}">
                                <input type="submit" name = "Next" value = "Next">
                                <input type="submit" name = "End" value = "End">
                            </c:if>
                            <input type="text" hidden name = "cp" value = "${CP.cp}">
                            <input type="text" hidden name = "np" value = "${CP.np}">
                            <select name="nrpp">
                                <c:forEach items="${CP.arrNrpp}" var="i" varStatus="loop">
                                    <option value="${loop.index}"
                                            <c:if test="${loop.index == sessionScope.nrpp}">
                                                selected
                                            </c:if>    
                                            >${i}
                                    </option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                </div>
            </div>


        </div>