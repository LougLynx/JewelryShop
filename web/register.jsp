<%-- 
    Document   : register
    Created on : Oct 27, 2024, 7:03:14 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Aroma Shop - Login</title>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="icon" href="img/Fevicon.png" type="image/png">
        <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

        <link rel="stylesheet" href="css/style.css">

        <style>
            .error{
                color: red;
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
                            <h1>Register</h1>
                            <nav aria-label="breadcrumb" class="banner-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Register</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ================ end banner area ================= -->

            <!--================Login Box Area =================-->
            <section class="login_box_area section-margin">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="login_box_img">
                                <div class="hover">
                                    <h4>Already have an account?</h4>
                                    <p>There are advances being made in science and technology everyday, and a good example of this is the</p>
                                    <a class="button button-account" href="login.jsp">Login Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="login_form_inner register_form_inner">
                                <h3>Create an account</h3>
                                <form class="row login_form" action="register" method="post" id="register_form" >
                                    <div class="col-md-12 form-group">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'" required="">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'" required="">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required="">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password'" required="">
                                    </div>
                                    <!--                                    <div class="col-md-12 form-group">
                                                                            <div class="creat_account">
                                                                                <input type="checkbox" id="f-option2" name="selector">
                                                                                <label for="f-option2">Keep me logged in</label>
                                                                            </div>
                                                                        </div>-->
                                    <div class="col-md-12 form-group">
                                        <button type="submit" value="submit" class="button button-register w-100">Register</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--================End Login Box Area =================-->



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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
        <script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/validate/jquery.validate.js"></script>
        <script type="text/javascript">
                $(document).ready(function () {

                    $("#register_form").validate({
                        rules: {

                            confirmPassword: {
                                equalTo: "#password"
                            }
                        }
                    });
                });
        </script>
    </body>
</html>
