

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <link rel="stylesheet" href="./css/Registration.css">
        <link rel="icon" type="image/x-icon" href="../img/core-img/favi.jpg">


    </head>
    <body>
        <div class="wrapper">
            <div class="title">
                <div class="sub_title"><a id="login_link" href="Login.jsp">Login</a></div>
                <div class="sub_title">Sign up</div>
            </div>
             <p id="noti">${Success}</p>
            <div class="input_info">
                <form action="RegisterControl" method="post">
                    <label class="lable" for="fullname">Full name</label> <br>
                    <input class="input_space" id="fullname" type="text" name="Fullname" placeholder="Type your fullname" value="${fullName}" required>
                    <p class="errInput" style="color: red;">${ErrorFullName}</p>
                    <br>
                    <label class="lable" for="email">Email</label> <br>
                    <input class="input_space" id="email" type="text" name="Email" placeholder="Type your email" value="${Email}" required>
                    <p class="errInput" style="color: red;">${ErrorEmail}</p>
                    <p class="errInput" style="color: red;">${ExistEmail}</p>
                    <br>
                    <label class="lable" for="username">Username</label> <br>
                    <input class="input_space" id="username" type="text" name="UserName" placeholder="Type your username" value="${UserName}" required>
                    <p class="errInput" style="color: red;">${ErrorUser}</p>
                    <p class="errInput" style="color: red;">${ExistUser}</p>
                    <br>
                    <label class="lable" for="password">Password</label> <br>
                    <input class="input_space" type="password" id="password" name="Password" placeholder="Type your password" value="${Password}" required>
                    <p class="errInput" style="color: red;">${ErrorPassword}</p>
                    <br>
                    <label class="lable" for="cf_password">Confirm Password</label> <br>
                    <input class="input_space" type="password" id="cf_password" name="RepeatPass" placeholder="Repeat your password" value="${RepeatPass}" required>
                    <p class="errInput" style="color: red;">${ErrorRepeatPass}</p>
                    <br>
                    <label class="lable" for="address">Address </label> <br>
                    <input class="input_space" id="address" type="text" name="Address" placeholder="Type your address" value="${Address}" required>
                    
                    <br>
                    <label class="lable" for="phone">Phone </label> <br>
                    <input class="input_space" id="phone" type="text" name="Phone" placeholder="Type your phone" value="${Phone}"  required>
                    <p class="errInput" style="color: red;">${ErrorPhone}</p>
                    <br>
                    <input type="submit" value="SIGN UP" id="btn_login">
                </form>
            </div>
        </div>

    </body>
</html>
