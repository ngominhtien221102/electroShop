<%-- 
    Document   : Verify
    Created on : Jul 15, 2022, 10:29:07 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <style>
            card {
                width: 500px;
                padding: 10px;
                border-radius: 20px;
                background: #fff;
                border: none;
                height: 500px;
                position: relative;
            }

            .container {
                height: 500px;
            }

            body {
                background: #eee;
            }

            .mobile-text {
                color: #989696b8;
                font-size: 15px;
            }

            .form-control {
                margin-right: 12px;
            }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #ff8880;
                outline: 0;
                box-shadow: none;
            }

            .cursor {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <form action="VerifyControl" method="Post">
            <p style="color:red;text-align:center" >${message}</p>
            <div class="d-flex justify-content-center align-items-center container">
                <div class="card py-5 px-3">
                    <h5 class="m-0">Email verification</h5><span class="mobile-text">Enter the code we just send on email ${sessionScope.Account.getEmail()}<b class="text-danger"></b></span>
                    <div class="d-flex flex-row mt-5">
                        <input type="text" class="form-control" name="OTP" autofocus="">
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
