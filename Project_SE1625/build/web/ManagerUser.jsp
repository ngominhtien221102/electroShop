<%-- 
    Document   : UserControl
    Created on : Jun 29, 2022, 9:37:42 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
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
                                <h2>Manager User</b></h2>
                            </div>

                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>UserName</th>
                                <th>Password</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Role</th>
                            </tr>
                        </thead>
                    <c:forEach items="${uList}" var="i" begin="${CP.begin}" end="${CP.end}">
                        <tbody>
                            <tr>
                                <td>${i.getID()}</td>
                                <td>${i.getUserName()}</td>
                                <td>${i.getPassword()}</td>
                                <td>${i.getName()}</td>
                                <td>${i.getAddress()}</td>
                                <td>${i.getEmail()}</td>
                                <td>${i.getPhone()}</td>
                                <c:if test="${i.isStatus()}">
                                    <td>Active</td>
                                </c:if>
                                <c:if test="${!i.isStatus()}">
                                    <td>Inactive</td>
                                </c:if>

                                <c:choose>

                                    <c:when test = "${i.getRoleId() == 1}">
                                        <td>Admin</td>
                                    </c:when>

                                    <c:when test = "${i.getRoleId()  == 3}">
                                        <td>Administrators</td>
                                    </c:when>
                                    <c:when test = "${i.getRoleId()  == 4}">
                                        <td>User</td>
                                    </c:when>
                                </c:choose>
                                <td>
                                    <a href="EditUser?type=1&id=${i.getID()}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="EditUser?type=0&id=${i.getID()}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr> 
                        </tbody>
                    </c:forEach>
                </table>
                    <div class="clearfix">

                    <div>
                        <form action="EditUser" method="get">
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
            
               

        <div class="modal-dialog">
            <div class="modal-content">
                <form action="EditUser" method="POST">
                    <div class="modal-header">						
                        <h4 class="modal-title">Edit User</h4>
                    </div>
                    <div class="modal-body">	
                        <div class="form-group">
                            <label>ID</label>
                            <input readonly name="ID" type="text" class="form-control" value="${user.getID()}" required>
                        </div>
                        <div class="form-group">
                            <label>UserName</label>
                            <input readonly name="UserName" type="text" class="form-control" value="${user.getUserName()}" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input readonly name="Password" type="text" class="form-control" value="${user.getPassword()}" required>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input name="Name" type="text" class="form-control" value="${user.getName()}" required>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <input name="Address" type="text" class="form-control" value="${user.getAddress()}" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input name="Email" type="text" class="form-control" value="${user.getEmail()}" required>
                        </div>	
                        <div class="form-group">
                            <label>Phone</label>
                            <input name="Phone" type="text" class="form-control" value="${user.getPhone()}" required>
                        </div>
                        <div class="form-check">
                            <label>Status</label>
                            <input class="form-check-input" type="radio" name="Status" value='True' ${user.isStatus()?"checked":""} > 
                            <label class="form-check-label" for="flexRadioDefault1">
                                Active
                            </label>
                            <input class="form-check-input" type="radio" name="Status" value='False' ${user.isStatus()?"":"checked"} >
                            <label class="form-check-label" for="flexRadioDefault1" >
                               Inactive
                            </label>
                        </div>

                        <select name="Role" class="form-select form-select-sm" aria-label=".form-select-sm example">
                            <option value="3" ${user.getRoleId()==3?"Selected":""} >Administrators</option>
                            <option value="4" ${user.getRoleId()==4?"Selected":""} >User</option>
                        </select>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
