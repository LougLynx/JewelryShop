<%-- 
    Document   : ManagerProduct
    Created on : Jan 13, 2021, 2:08:03 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Title Page-->
        <title>Manage Product</title>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!-- Main CSS-->
        <link href="css/manager.css" rel="stylesheet" media="all">
        <style>
            img {
                width: 100px;
                height: 100px;
            }
        </style>
    </head>
    <body>

        <div class="page-wrapper">
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <nav class="navbar navbar-default">
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <a class="navbar-brand" href="dashboard">Aroma Shop</a>
                                </div>
                                <ul class="nav navbar-nav">
                                    <li><a href="dashboard">Dashboard</a></li>
                                    <li class="active"><a href="products">Manage Product</a></li>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->

            <!-- list------------------------------------------------------------------- -->
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Product</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listP}" var="o"> 
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        <img src="${o.image}">
                                    </td>
                                    <td>${o.price} $</td>
                                    <td>
                                        <a onclick="editProduct(${o.id})" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="delete-product?id=${o.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach> 
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${pageIndex == i ? "active":""}""><a href="products?pageIndex=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Create Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="add-product" method="post">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="image" type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" type="number" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" id="add-des"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Amount</label>
                                    <input name="amount" type="number" class="form-control" required min="0">
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-control" aria-label="Default select example">
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="editEmployeeModal" class="modal fade">

            </div>

            <script src="js/manager.js" type="text/javascript"></script>
            <script>
                                            function editProduct(param) {
                                                var id = param;
                                                console.log(id);
                                                $.ajax({
                                                    url: "update-product",
                                                    type: "get", //send it throung get method
                                                    data: {
                                                        id: id
                                                    },
                                                    success: function (data) {
                                                        var row = document.getElementById("editEmployeeModal");
                                                        row.innerHTML = data;
                                                        $("#editEmployeeModal").modal('show');
                                                        CKEDITOR.replace('edit-des', {versionCheck: false});

                                                    },
                                                    error: function (xhr) {
                                                        //do something to handle error
                                                    }
                                                });
                                            }
            </script>
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
            <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>



            <script>
                CKEDITOR.replace('add-des', {versionCheck: false});
            </script>
            <script>
                CKEDITOR.replace('edit-des', {versionCheck: false});
            </script>

    </body>
</html>
