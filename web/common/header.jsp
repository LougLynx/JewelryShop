<%-- 
    Document   : header
    Created on : Oct 27, 2024, 7:04:27 PM
    Author     : Admin
--%>
<%@page import="entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand logo_h" href="home"><img src="img/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
                        <li class="nav-item active"><a class="nav-link" href="home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="shop">Shop</a></li>
                            <c:if test="${sessionScope.acc == null}">
                            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                            </c:if>
                            <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                            </c:if>

<!--                                                <li class="nav-item submenu dropdown">
                                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                                       aria-expanded="false">Shop</a>
                                                    <ul class="dropdown-menu">
                                                        <li class="nav-item"><a class="nav-link" href="category.html">Shop Category</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="single-product.html">Product Details</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li>
                                                    </ul>
                                                </li>
                                                <li class="nav-item submenu dropdown">
                                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                                       aria-expanded="false">Blog</a>
                                                    <ul class="dropdown-menu">
                                                        <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
                                                    </ul>
                                                </li>
                                                <li class="nav-item submenu dropdown">
                                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                                       aria-expanded="false">Pages</a>
                                                    <ul class="dropdown-menu">
                                                        <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li>
                                                        <li class="nav-item"><a class="nav-link" href="tracking-order.html">Tracking</a></li>
                                                    </ul>
                                                </li>
                                                <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>-->
                    </ul>

                    <ul class="nav-shop">
                        <!--<li class="nav-item"><button><i class="ti-search"></i></button></li>-->
                        <%
            Cart c = (Cart) session.getAttribute("cart");
            int count = 0;
            if(c!=null){
                count = c.getItems().size();
            }
                        %>
                        <li class="nav-item"><button><a href="cart.jsp"><i class="ti-shopping-cart"></i><span class="nav-shop__circle"><%= count%></span></button> </a></li>
                        <li class="nav-item"><a class="button button-header" href="shop">Buy Now</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
