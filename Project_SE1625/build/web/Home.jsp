<%-- 
    Document   : index
    Created on : Jun 19, 2022, 2:22:23 PM
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

    </head>
    <body>

        <jsp:include page="Header.jsp"></jsp:include>

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- shop -->
                        <div class="col-md-4 col-xs-6">
                            <div class="shop">
                                <div class="shop-img">
                                    <img src="./img/shop01.png" alt="">
                                </div>
                                <div class="shop-body">
                                    <h3>Laptop<br>Collection</h3>
                                    <a href="FilterProductCate?type=1" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /shop -->

                        <!-- shop -->
                        <div class="col-md-4 col-xs-6">
                            <div class="shop">
                                <div class="shop-img">
                                    <img src="./img/shop03.png" alt="">
                                </div>
                                <div class="shop-body">
                                    <h3>Accessories<br>Collection</h3>
                                    <a href="FilterProductCate?type=2" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /shop -->

                        <!-- shop -->
                        <div class="col-md-4 col-xs-6">
                            <div class="shop">
                                <div class="shop-img">
                                    <img src="./img/shop04.png" alt="">
                                </div>
                                <div class="shop-body">
                                    <h3>SmartPhones<br>Collection</h3>
                                    <a href="FilterProductCate?type=3" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /shop -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /SECTION -->

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">

                        <!-- section title -->
                        <div class="col-md-12">
                            <div class="section-title">
                                <h3 class="title">New Products</h3>
                                <div class="section-nav">
                                    <ul class="section-tab-nav tab-nav">
                                        <li  class="active"><a data-toggle="HomeControl?type=1" href="HomeControl?type=1">Laptops</a></li>
                                        <li><a data-toggle="" href="HomeControl?type=2">Smartphones</a></li>
                                        <li><a data-toggle="" href="HomeControl?type=3">Accessories</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /section title -->

                        <!-- Products tab & slick -->
                        <div class="col-md-12">
                            <div class="row">
                                <div class="products-tabs">
                                    <!-- tab -->
                                    <div id="tab1" class="tab-pane active">
                                        <div class="products-slick" data-nav="#slick-nav-1">
                                            <!-- product -->
                                        <c:forEach items="${listP}" var ="o">
                                            <div class="product" data-name ="${o.getID()}" >
                                                <div class="product-img">
                                                    <img height="263" src="./Product_Image/${o.image}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <c:forEach items="${listC}" var = "i">
                                                        <c:if test= "${o.categoryID == i.getID()}">
                                                            <p class="product-category">${i.getName()}</p>
                                                        </c:if>
                                                    </c:forEach>

                                                    <h3 class="product-name"><a href="ProductControl?id=${o.getID()}">${o.name}</a></h3>
                                                    <h4 class="product-price">$${o.price}<del  <c:if test= "${o.getOldPrice() == 0}">
                                                                style =" display: none"
                                                            </c:if> class="product-old-price"> $${o.getOldPrice()} </del></h4>

                                                </div>
                                                <c:if test="${sessionScope.Account.getRoleId() == 4}" >
                                                    <c:if test="${o.getQuantity() > 0}">
                                                        <div class="add-to-cart">
                                                            <button onclick="location.href = 'CartControl?num=1&id=${o.getID()}';" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </div>
                                                    </c:if>
                                                </c:if>

                                                <c:if test="${sessionScope.Account.getRoleId() == 1}" >
                                                    
                                                        <div class="add-to-cart">
                                                            <button onclick="location.href = 'EditProduct?type=1&id=${o.getID()}';"class="add-to-cart-btn">Edit Product</button>
                                                        </div>
                                                    </c:if>
                                                

                                            </div>
                                        </c:forEach>

                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>

                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to 50% OFF</p>
                            <a class="primary-btn cta-btn" href="store.jsp">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Top selling</h3>

                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                    <c:forEach items="${sessionScope.topSell}" var ="o">
                                            <div class="product" data-name ="${o.getID()}" >
                                                <div class="product-img">
                                                    <img height="263" src="./Product_Image/${o.image}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <c:forEach items="${listC}" var = "i">
                                                        <c:if test= "${o.categoryID == i.getID()}">
                                                            <p class="product-category">${i.getName()}</p>
                                                        </c:if>
                                                    </c:forEach>

                                                    <h3 class="product-name"><a href="ProductControl?id=${o.getID()}">${o.name}</a></h3>
                                                    <h4 class="product-price">$${o.price}<del  <c:if test= "${o.getOldPrice() == 0}">
                                                                style =" display: none"
                                                            </c:if> class="product-old-price"> $${o.getOldPrice()} </del></h4>

                                                </div>
                                                <c:if test="${sessionScope.Account.getRoleId() == 4}" >
                                                    <c:if test="${o.getQuantity() > 0}">
                                                        <div class="add-to-cart">
                                                            <button onclick="location.href = 'CartControl?num=1&id=${o.getID()}';" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                        </div>
                                                    </c:if>
                                                </c:if>

                                                <c:if test="${sessionScope.Account.getRoleId() == 1}" >
                                                    
                                                        <div class="add-to-cart">
                                                            <button onclick="location.href = 'EditProduct?type=1&id=${o.getID()}';"class="add-to-cart-btn">Edit Product</button>
                                                        </div>
                                                    </c:if>
                                                

                                            </div>
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->



        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>Tay Ho, Ha Noi, Viet Nam</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>1900 1788</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>Electroshop19@gmail.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                    <li><a href="#">Laptops</a></li>
                                    <li><a href="#">Smartphones</a></li>
                                    <li><a href="#">Accessories</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
