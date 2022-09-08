<%-- 
    Document   : Header
    Created on : Jun 29, 2022, 11:34:18 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="HomeControl"> Home </a></li>
                        <li><a href="StoreControl"> Store </a></li>
                            <c:if test="${sessionScope.Account.getRoleId() == 1}">
                            <li><a href="EditUser"><i ></i>Manager User</a></li>
                            <li><a href="EditProduct"><i ></i>Manager Product</a></li>
                            <li><a href="ViewCart"><i ></i>View Cart</a></li>
                            <li><a href="EditPass"><i ></i>Change Password</a></li>
                            </c:if>
                            <c:if test="${sessionScope.Account.getRoleId() == 3}">
                            <li><a href="EditProduct"><i ></i>Manager Product</a></li>
                            <li><a href="EditPass"><i ></i>Change Password</a></li>
                            </c:if>
                            <c:if test="${sessionScope.Account.getRoleId() == 4}">
                            <li><a href="EditProfile"><i ></i>Edit Profile</a></li>
                            <li><a href="EditPass"><i ></i>Change Password</a></li>
                            </c:if>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                            <c:if test="${sessionScope.Account != null}">
                            <li><a href="#"><i ></i>Hello ${sessionScope.Account.getName()}</a></li>
                            <li><a href="LogoutControl"><i class="fa fa-user-o"></i>Logout</a></li>
                            </c:if>
                            <c:if test="${sessionScope.Account == null}">
                            <li><a href="Login.jsp"><i class="fa fa-user-o"></i> Sign in/Register</a></li>
                            </c:if>

                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="HomeControl" class="logo">
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="SearchControl" method ="post" >
                                   
                                    <select name="Cate" class="input-select">
                                        <option value="0" ${cateID ==0?"Selected":""} >All Categories</option>
                                         <c:forEach items="${sessionScope.cate}" var="i">
                                                    <option value="${i.getID()}" ${cateID==i.getID()?"Selected":""}>${i.getName()}</option>
                                         </c:forEach>
                                    </select>
                                    <input name="txt" class="input" value="${txtS}"  placeholder="Search here">
                                    <button class="search-btn">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">




                                <!-- Cart -->
                                <c:if test="${sessionScope.Account.getRoleId() == 4}">
                                    <div class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>Your Cart</span>
                                            <div class="qty">${cart.getItems().size()}</div>
                                        </a>




                                        <div class="cart-dropdown">
                                            <div class="cart-list">
                                                <c:forEach items="${cart.getItems()}" var="i">
                                                    <div class="product-widget">
                                                        <div class="product-img">
                                                            <img src="./Product_Image/${i.getProduct().getImage()}" alt="">
                                                        </div>
                                                        <div class="product-body">
                                                            <h3 class="product-name"><a href="ProductControl?id=${i.getProduct().getID()}">${i.getProduct().getName()}</a></h3>
                                                            <h4 class="product-price"><span class="qty">${i.getQuantity()}X</span>$${i.getProduct().getPrice()}</h4>
                                                        </div>

                                                    </div>
                                                </c:forEach>

                                            </div>
                                            <div class="cart-summary">
                                                <small>${cart.getItems().size()} Item(s) selected</small>
                                                <h5>SUBTOTAL: $${cart.getTotalMoney()}</h5>
                                            </div>
                                            <div class="cart-btns">
                                                <a href="EditCart">View Cart</a>
                                                <a href="CheckoutControl">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>

                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->
    </body>
</html>
