<%-- 
    Document   : forgetpass
    Created on : Jul 17, 2022, 6:38:21 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>  
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="text-center">
                                    <h3><i class="fa fa-lock fa-4x"></i></h3>
                                    <h2 class="text-center">Forgot Password?</h2>
                                    <p>You can reset your password here.</p>
                                    <div class="panel-body">

                                        <form action="ForgetPass" method="Post">
                                            <fieldset>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-user-o"></i></span>

                                                        <input name="userName" placeholder="Enter your UserName" class="form-control"  required="">
                                                    </div>
                                                </div>
                                                <p style="color : red">${Message}</p>
                                                <div class="form-group">
                                                    <input class="btn btn-lg btn-primary btn-block" value="Send OTP to reset pass" type="submit">
                                                </div>
                                            </fieldset>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
