<%-- 
    Document   : store
    Created on : Jun 20, 2022, 2:22:12 PM
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

        <title>ELECTRO SHOP</title>

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


            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- ASIDE -->
                        <div id="aside" class="col-md-3">
                            <!-- aside Widget -->

                            <div class="aside">
                                <h3 class="aside-title">Categories</h3>
                            <c:forEach items="${cList}" var="i"  >
                                <a href="FilterProductCate?type=${i.getID()}">${i.getName()}</a>
                                <br>
                            </c:forEach>
                        </div>
                        <div class="aside">
                            <h3 class="aside-title">Brand</h3>
                            <c:forEach items="${bList}" var="i">
                                <a href="FilterProductBrand?type=${i}">${i}</a>
                                <br>
                            </c:forEach>
                        </div>

                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Top selling</h3>
                              <c:forEach items="${sessionScope.topSell}" var="i">
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./Product_Image/${i.image}" alt="">
                                </div>
                                <div class="product-body">
                                    <c:forEach items="${sessionScope.cate}" var = "o">
                                                        <c:if test= "${i.categoryID == o.getID()}">
                                                            <p class="product-category">${o.getName()}</p>
                                                        </c:if>
                                                    </c:forEach>
                                    <h3 class="product-name"><a href="ProductControl?id=${i.getID()}">${i.getName()})</a></h3>
                                    <h4 class="product-price">$${i.getPrice()}<del class="product-old-price">$${i.getOldPrice()}</del></h4>
                                </div>
                           
                          
                             </div>
                                  </c:forEach>
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">


                        <!-- store products -->
                        <div class="row">
                            <!-- product -->


                            <c:if test="${method == 'StoreControl'}">
                                <c:forEach items="${pList}" var ="i"  begin="${CP.begin}" end="${CP.end}">

                                    <!-- product -->
                                    <div class="clearfix visible-sm visible-xs"></div>
                                    <div class="col-md-4 col-xs-6">
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="./Product_Image/${i.getImage()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <c:forEach items="${cList}" var = "o">
                                                    <c:if test= "${i.categoryID == o.getID()}">
                                                        <p class="product-category">${o.getName()}</p>
                                                    </c:if>
                                                </c:forEach>

                                                <h3 class="product-name"><a href="ProductControl?id=${i.getID()}">${i.getName()}</a></h3>
                                                <h4 class="product-price">$${i.getPrice()} <del  <c:if test= "${i.getOldPrice() == 0}">
                                                            style =" display: none"
                                                        </c:if> class="product-old-price"> $${i.getOldPrice()} </del></h4   >
                                            </div>
                                            <c:if test="${sessionScope.Account.getRoleId() == 4}" >
                                                <c:if test="${i.getQuantity() > 0}">
                                                    <div class="add-to-cart">
                                                        <button onclick="location.href = 'CartControl?num=1&id=${i.getID()}';" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                    </div>
                                                </c:if>
                                            </c:if>
                                             <c:if test="${sessionScope.Account.getRoleId() == 1}" >
                                                    <div class="add-to-cart">
                                                        <button onclick="location.href = 'EditProduct?type=1&id=${i.getID()}';"class="add-to-cart-btn">Edit Product</button>
                                                    </div>
                                                    </c:if>
                                            
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>

                            <c:if test="${method != 'StoreControl'}">
                                <c:forEach items="${pList}" var ="i" >

                                    <!-- product -->
                                    <div class="clearfix visible-sm visible-xs"></div>
                                    <div class="col-md-4 col-xs-6">
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="./Product_Image/${i.getImage()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <c:forEach items="${cList}" var = "o">
                                                    <c:if test= "${i.categoryID == o.getID()}">
                                                        <p class="product-category">${o.getName()}</p>
                                                    </c:if>
                                                </c:forEach>

                                                <h3 class="product-name"><a href="ProductControl?id=${i.getID()}">${i.getName()}</a></h3>
                                                <h4 class="product-price">$${i.getPrice()} <del  <c:if test= "${i.getOldPrice() == 0}">
                                                            style =" display: none"
                                                        </c:if> class="product-old-price"> $${i.getOldPrice()} </del></h4   >
                                            </div>
                                            <c:if test="${sessionScope.Account.getRoleId() == 4}" >
                                                <c:if test="${i.getQuantity() > 0}">
                                                    <div class="add-to-cart">
                                                        <button onclick="location.href = 'CartControl?num=1&id=${i.getID()}';" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                    </div>
                                                </c:if>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <!-- /product -->
                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <c:if test="${method == 'StoreControl'}">
                            <div class="store-filter clearfix">
                                <div>
                                    <form action="${method}" method="Post">
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
                        </c:if>

                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
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
