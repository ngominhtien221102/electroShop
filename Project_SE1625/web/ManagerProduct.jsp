<%-- 
    Document   : ProductEdit
    Created on : Jun 29, 2022, 9:38:16 AM
    Author     : Lenovo
--%>

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
                                <h2>Manage Product</b</h2>
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
        <!-- Edit Modal HTML -->

        <div class="modal-dialog">
            <div class="modal-content">
                <form action="EditProduct" enctype="multipart/form-data" method="post">
                    <div class="modal-header">						
                        <h4 class="modal-title">Add/Edit Product</h4>
                    </div>
                    <div class="modal-body">	
                        <div class="form-group">
                            <label>ID</label>
                            <input readonly name="ID" type="text" class="form-control" value="${Product.getID()}" required>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input name="Name" type="text" class="form-control" value="${Product.getName()}" required>
                        </div>
                        <div class="form-group">
                            <label>Quantity</label>
                            <input name="Quantity" type="number" class="form-control" min="0" value="${Product.getQuantity()}" required>
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input name="Price" type="text" class="form-control" value="${Product.getPrice()}" required>
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <select  name="Category" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <c:forEach items="${cList}"  var="i">
                                    <option value="${i.getID()}" ${Product.getCategoryID()==i.getID()?"Selected":""}>${i.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Brand</label>
                            <input name="Brand" type="text" class="form-control" value="${Product.getBrand()}"  required>
                        </div>

                        <div class="form-group">
                            <label>Description</label>
                            <textarea style="height: 200px" name="Description" class="form-control"  required  >${Product.getDescription()}</textarea>
                        </div>

                        <div class="form-group">
                            <label>Old Price</label>
                            <input name="OldPrice" type="text" class="form-control" value="${Product.getOldPrice()}" required>
                        </div>

                        <div class="form-group">
                            <label>Image</label>
                            <input name="Image"  type="file" class="form-control" accept="image/png, image/jpeg" >
                        </div>

                        <div class="form-group">
                            <label>Color</label>
                            <input name="Color" type="text" class="form-control" value="${Product.getColor()}" required>
                        </div>

                        <div class="form-group">
                            <label>Size</label>
                            <input name="Size" type="text" class="form-control" value="${Product.getSize()}" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" value= ${Product.getID()==null?"Add":"Update"}>
                    </div>
                </form>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	

                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="js/Manager.js" type="text/javascript"></script>
    </body>
</html>
