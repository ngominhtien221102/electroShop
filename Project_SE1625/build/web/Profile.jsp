<%-- 
    Document   : Profile
    Created on : Jul 8, 2022, 2:48:08 AM
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
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="EditProfile" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit User</h4>
                        </div>
                        <div class="modal-body">	
                            <div class="form-group">
                                <label>Name</label>
                                <input name="Name" type="text" class="form-control" value="${User.getName()}" required>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <input name="Address" type="text" class="form-control" value="${User.getAddress()}" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input name="Email" type="text" class="form-control" value="${User.getEmail()}"  required>
                        </div>	
                        <div class="form-group">
                            <label>Phone</label>
                            <input name="Phone" type="text" class="form-control" value="${User.getPhone()}" required>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>


 
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>