<%-- 
    Document   : Cart
    Created on : Jun 26, 2022, 11:09:50 PM
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

        <title>Electro - HTML Ecommerce Template</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

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

    </head>
    <body>

        <jsp:include page="Header.jsp"></jsp:include>
            <!-- /Cart -->



            <!-- /HEADER -->

            <!-- SECTION -->
             <form action="CheckoutControl" method="POST">
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">

                        <div class="col-md-7">
                            <!-- Billing Details -->
                            <div class="billing-details">
                                <div class="section-title">
                                    <h3 class="title">Billing address</h3>
                                </div>
                                <div class="form-group">
                                    Full-Name: <input readonly class="input" type="text" name="full name" placeholder="Full Name" 
                                                      value="${User.getName()}">
                            </div>
                            <div class="form-group">
                                Email: <input readonly class="input" type="email" name="email" placeholder="Email"
                                              value="${User.getEmail()}" >
                            </div>
                            <div  class="form-group">
                                Address: <input  readonly class="input" type="text" name="address" placeholder="Address"
                                                 value="${User.getAddress()}">
                            </div>
                            <div class="form-group">
                                Phone: <input readonly class="input" type="tel" name="tel" placeholder="Phone"
                                              value="${User.getPhone()}">
                            </div>
                            <div class="form-group">
                                Order Notes
                                <div class="order-notes">
                                    <textarea class="input" name="Note" placeholder="Order Notes"></textarea>
                                </div>
                            </div>
                        </div>
                        <!-- /Billing Details -->

                        <!-- Shiping Details -->

                        <!-- /Shiping Details -->
                    </div>

                    <!-- Order Details -->
                   
                        <div class="col-md-5 order-details">
                            <div class="section-title text-center">
                                <h3 class="title">Your Order</h3>
                            </div>
                            <div class="order-summary">
                                <div class="order-col">
                                    <div><strong>PRODUCT</strong></div>
                                    <div><strong>TOTAL</strong></div>
                                </div>

                                <div class="order-products">
                                    <c:forEach items="${cart.getItems()}" var="i">
                                        <div class="order-col">
                                            <div>${i.getQuantity()}X ${i.getProduct().getName()}</div>
                                            <div>$${i.getProduct().getPrice()}</div>
                                        </div>
                                    </c:forEach>


                                </div>
                                <div class="order-col">
                                    <div>Shiping</div>
                                    <div><strong>FREE</strong></div>
                                </div>
                                <div class="order-col">
                                    <div><strong>TOTAL</strong></div>
                                    <div><strong class="order-total">$${cart.getTotalMoney()}</strong></div>
                                </div>
                            </div>

                            <div class="input-checkbox">
                                <input type="checkbox" id="terms">
                                <label for="terms">
                                    <span></span>
                                    I've read and accept the <a href="#">terms & conditions</a>
                                </label>
                            </div>

                            <input type="submit" class="primary-btn order-submit" value="Place Order">

                        </div>
               
                    <!-- /Order Details -->

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
                                     </form>
        <!-- /SECTION -->



        <%@include file="footer.jsp" %>

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>

