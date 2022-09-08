

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Electro Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
  
    </head>
    <body>
       
            <div class="col-md-6 offset-md-3">
                    <span class="anchor" id="formChangePassword"></span>
                    <hr class="mb-5">

                    <!-- form card change password -->
                    <div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Change Password</h3>
                        </div>
                        <div class="card-body">
                            <form action="ChangePass" method="Post">
                                <div class="form-group">
                                    <label for="inputPasswordOld">New Password</label>
                                    <input type="password" class="form-control"  name="newPass" value="${newPass}" required="">
                                    <p style="color : red">${error1}</p>
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNew">Confirm Password</label>
                                    <input type="password" class="form-control" name="repeatPass" value="${repeatPass}" required="">
                                   <p style="color : red">${error2}</p>
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNewVerify">OTP code to change</label>
                                    <input type="text" class="form-control" name="OTP" required="">
                                    <span class="form-text small text-muted">
                                        Check email ${sessionScope.userForgot.getEmail()} to get OTP code.
                                        </span>
                                        <p style="color : red">${error3}</p>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-lg float-right">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /form card change password -->

                </div>
               
           

    </body>
</html>