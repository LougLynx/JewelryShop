<%-- 
    Document   : shop
    Created on : Oct 27, 2024, 6:59:45 PM
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
        <title>Aroma Shop - Category</title>
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
                            <h1>Shop</h1>
                            <nav aria-label="breadcrumb" class="banner-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Shop</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ================ end banner area ================= -->


            <!-- ================ category section start ================= -->		  
            <section class="section-margin--small mb-5" id="shop-filter">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-lg-4 col-md-5">
                            <div class="sidebar-categories">
                                <div class="head">Categories</div>
                                <ul class="main-categories">
                                    <li class="common-filter">
                                        <form action="#">
                                            <ul>
                                                <li class="filter-list"><input class="pixel-radio" type="radio" id="cat" name="category" checked value=""><label for="cat">All</label></li>
                                                <c:forEach items="${listC}" var="c">
                                                <li class="filter-list"><input class="pixel-radio" type="radio" id="cat${c.id}" name="category" value="${c.id}"><label for="cat${c.id}">${c.name}</label></li>
                                                </c:forEach>
                                        </ul>
                                    </form>
                                </li>
                            </ul>
                        </div>
                        <div class="sidebar-filter">
                            <div class="top-filter-head">Filters</div>
                            <div class="common-filter">
                                <div class="head">Price</div>
                                <form action="#">
                                    <ul>
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="pri" name="priceRange" value="" checked=""><label for="pri">All</label></li>
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="priLow" name="priceRange" value="low"><label for="priLow">< 300</label></li>
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="priMedium" name="priceRange" value="medium"><label for="priMedium">300 - 1000</label></li>
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="priHigh" name="priceRange" value="high"><label for="priHigh">> 1000</label></li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-8 col-md-7">
                        <!-- Start Filter Bar -->
                        <div class="filter-bar d-flex flex-wrap align-items-center">
                            <div class="sorting">
                                <select name="sort" id="sortFilter">
                                    <option value="">Default sorting</option>
                                    <option value="asc">Price ascending</option>
                                    <option value="desc">Price descending</option>
                                </select>
                            </div>
                            <div class="sorting mr-auto">

                            </div>
                            <div>
                                <div class="input-group filter-bar-search">
                                    <input type="text" placeholder="Search" name="txtSearch" id="txtSearch" oninput="loadProducts()">
                                    <div class="input-group-append">
                                        <button type="button"><i class="ti-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Filter Bar -->
                        <!-- Start Best Seller -->
                        <section class="lattest-product-area pb-40 category-list">
                            <div class="row">
                                <c:forEach items="${listP}" var="o">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="card text-center card-product">
                                            <div class="card-product__img">
                                                <img class="card-img" src="${o.image}" alt="">
                                                <ul class="card-product__imgOverlay">
                                                    <li><button><i class="ti-search"></i></button></li>
                                                                <c:if test="${o.amount != 0}">
                                                        <li><button><a href="cart?id=${o.id}&action=add"><i class="ti-shopping-cart"></i></a></button></li>
                                                                </c:if>
                                                    <li><button><i class="ti-heart"></i></button></li>
                                                </ul>
                                            </div>
                                            <div class="card-body">
                                                <p>${o.category.name}</p>
                                                <h4 class="card-product__title"><a href="detail?id=${o.id}">${o.name}</a></h4>
                                                <p class="card-product__price">$${o.price}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <nav aria-label="navigation">
                                        <ul class="pagination justify-content-end mt-50" id="paging">
                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                                <li class="page-item ${i == pageIndex ? 'active' : ''}">
                                                    <a href="javascript:void(0)" data-page="${i}" class="page-link">${i}</a>
                                                </li>

                                            </c:forEach>
                                        </ul>
                                    </nav>
                                </div>
                            </div>

                        </section>
                    </div>
                </div>
            </div>
        </section>
        <!-- ================ category section end ================= -->		  


        <!-- ================ Subscribe section start ================= -->		  
        <section class="subscribe-position">
            <div class="container">
                <div class="subscribe text-center">
                    <h3 class="subscribe__title">Get Update From Anywhere</h3>
                    <p>Bearing Void gathering light light his eavening unto dont afraid</p>
                    <div id="mc_embed_signup">
                        <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe-form form-inline mt-5 pt-1">
                            <div class="form-group ml-sm-auto">
                                <input class="form-control mb-1" type="email" name="EMAIL" placeholder="Enter your email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '" >
                                <div class="info"></div>
                            </div>
                            <button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe Now</button>
                            <div style="position: absolute; left: -5000px;">
                                <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </section>
        <!-- ================ Subscribe section end ================= -->		  


        <!--================ Start footer Area  =================-->	
        <jsp:include page="common/footer.jsp"></jsp:include>
        <!--================ End footer Area  =================-->



        <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="vendors/skrollr.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
        <script src="vendors/nouislider/nouislider.min.js"></script>
        <script src="vendors/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/mail-script.js"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript">
                                    $(document).ready(function () {
                                        // Define a function to load products based on filters
                                        function loadProducts(page = 1) {
                                            const category = $('input[name="category"]:checked').val();
                                            const priceRange = $('input[name="priceRange"]:checked').val();
                                            const sort = $('#sortFilter').val();
                                            const txtSearch = $('#txtSearch').val();

                                            $.ajax({
                                                url: 'shop-filter', // URL endpoint for the server-side code handling product fetching
                                                method: 'GET',
                                                data: {
                                                    cID: category,
                                                    priceRange: priceRange,
                                                    sort: sort,
                                                    txtSearch: txtSearch,
                                                    pageIndex: page
                                                },
                                                success: function (response) {
                                                    $('#shop-filter').html(response);
                                                },
                                                error: function () {
                                                    alert("There was an error loading the products.");
                                                }
                                            });
                                        }

                                        // Attach change events to filters
                                        $('input[name="category"], input[name="priceRange"]').on('change', function () {
                                            loadProducts(); // Load products when category or price changes
                                        });

                                        $('#sortFilter').on('change', function () {
                                            loadProducts(); // Load products when sorting changes
                                        });

                                        $('#txtSearch').on('change', function () {
                                            loadProducts(); // Load products when sorting changes
                                        });


                                        $(document).on('click', '.page-link', function () {
                                            var page = $(this).data('page'); // Lấy số trang từ thuộc tính data-page
                                            if (page) {
                                                loadProducts(page); // Gọi hàm loadProducts với số trang
                                            }
                                        });
                                    });
        </script>
    </body>
</html>
