<%-- 
    Document   : shop-filter
    Created on : Oct 28, 2024, 3:00:15 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                        <li class="filter-list"><input class="pixel-radio" type="radio" id="cat${c.id}" name="category" value="${c.id}" <c:if test="${c.id == cID}">checked</c:if>><label for="cat${c.id}">${c.name}</label></li>
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
                                <li class="filter-list"><input class="pixel-radio" type="radio" id="priLow" name="priceRange" value="low" <c:if test="${priceRange eq 'low'}">checked</c:if>><label for="priLow">< 300</label></li>
                                <li class="filter-list"><input class="pixel-radio" type="radio" id="priMedium" name="priceRange" value="medium"  <c:if test="${priceRange eq 'medium'}">checked</c:if>><label for="priMedium">300 - 1000</label></li>
                                <li class="filter-list"><input class="pixel-radio" type="radio" id="priHigh" name="priceRange" value="high"  <c:if test="${priceRange eq 'high'}">checked</c:if>><label for="priHigh">> 1000</label></li>
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
                                <option value="asc" <c:if test="${sort eq 'asc'}">selected</c:if>>Price ascending</option>
                            <option value="desc" <c:if test="${sort eq 'desc'}">selected</c:if>>Price descending</option>
                            </select>
                        </div>
                        <div class="sorting mr-auto">

                        </div>
                        <div>
                            <div class="input-group filter-bar-search">
                                <input type="text" placeholder="Search" name="txtSearch" id="txtSearch" oninput="loadProducts()" value="${searchValue}">
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
