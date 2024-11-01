<%-- 
    Document   : checkout
    Created on : Oct 27, 2024, 7:02:37 PM
    Author     : Admin
--%>
<%@page import="entity.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Aroma Shop - Checkout</title>
        <link rel="icon" href="img/Fevicon.png" type="image/png">
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

        <link rel="stylesheet" href="css/style.css">
        <style>.list {
                list-style-type: none;
                padding: 0;
            }

            .list li {
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
                border-bottom: 1px solid #ddd;
            }

            .product-info {
                display: flex;
                flex: 1;
                align-items: center;
            }

            .product-name {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                max-width: 200px; /* Adjust width as needed */
                display: inline-block;
            }

            .quantity {
                margin-left: 5px;
                color: #777;
            }

            .price {
                min-width: 100px; /* Adjust as needed */
                text-align: right;
            }

            .price-header {
                min-width: 100px;
                display: inline-block;
                text-align: right;
            }

        </style>
    </head>
    <body>
        <!--================ Start Header Menu Area =================-->
        <jsp:include page="common/header.jsp"></jsp:include>
            <!--================ End Header Menu Area =================-->

            <!-- ================ start banner area ================= -->	
            <section class="blog-banner-area" id="category">
                <div class="container h-100">
                    <div class="blog-banner">
                        <div class="text-center">
                            <h1>Product Checkout</h1>
                            <nav aria-label="breadcrumb" class="banner-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ================ end banner area ================= -->


            <!--================Checkout Area =================-->
            <section class="checkout_area section-margin--small">
                <div class="container">

                    <div class="billing_details">
                        <div class="row">
                            <div class="col-lg-8">
                                <h3>Billing Details</h3>
                                <form class="row contact_form" action="checkout" method="post">
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="first" name="name" required="" placeholder="Full name" autofocus="">
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <input type="tel" class="form-control" id="company" name="phone" placeholder="Phone" pattern="0[0-9]{9}" title="Phone number must start with 0 and contain exactly 10 digits" required>
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <textarea type="text" class="form-control" id="number" name="address" placeholder="Address" required=""></textarea>
                                    </div>
                                    <!--</form>-->
                            </div>
                            <div class="col-lg-4">
                                <div class="order_box">
                                    <h2>Your Order</h2>
                                    <ul class="list">
                                    <c:forEach items="${sessionScope.cart.items}" var="o">
                                        <li>
                                            <a href="detail?id=${o.id}">
                                                <div class="product-info">
                                                    <span class="product-name">${o.name}</span>
                                                    <span class="quantity"> x ${o.numberInCart} </span>
                                                    <span class="quantity">$${o.price * o.numberInCart}</span>
                                                </div>
                                            </a>

                                        </li>
                                    </c:forEach>
                                </ul>
                                <ul class="list list_2">
                                    <%
                       Cart c = (Cart) session.getAttribute("cart");
                       double total = 0;
                       if(c != null){
                               total = c.getAmount();
                       }

                                    %>
                                    <li><a href="#">Total: <span> $<%=total %></span></a></li>
                                </ul>
                                <!--                        <div class="payment_item">
                                                            <div class="radion_btn">
                                                                <input type="radio" id="f-option5" name="selector">
                                                                <label for="f-option5">Check payments</label>
                                                                <div class="check"></div>
                                                            </div>
                                                            <p>Please send a check to Store Name, Store Street, Store Town, Store State / County,
                                                                Store Postcode.</p>
                                                        </div>
                                                        <div class="payment_item active">
                                                            <div class="radion_btn">
                                                                <input type="radio" id="f-option6" name="selector">
                                                                <label for="f-option6">Paypal </label>
                                                                <img src="img/product/card.jpg" alt="">
                                                                <div class="check"></div>
                                                            </div>
                                                            <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal
                                                                account.</p>
                                                        </div>-->

                                <div class="text-center">
                                    <button type="submit" class="button button-paypal">Checkout</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Checkout Area =================-->



        <!--================ Start footer Area  =================-->	
        <jsp:include page="common/footer.jsp"></jsp:include>
        <!--================ End footer Area  =================-->



        <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="vendors/skrollr.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
        <script src="vendors/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/mail-script.js"></script>
        <script src="js/main.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <c:if test="${message != null}">
        <script type="text/javascript">
                                                                toastr.success(`${message}`, 'Success', {timeOut: 1000});
        </script>
    </c:if>
    <c:if test="${errorMessage != null}">
        <script type="text/javascript">
                toastr.error(`${errorMessage}`, 'Error', {timeOut: 1000});
        </script>
    </c:if>
    </body>
</html>
