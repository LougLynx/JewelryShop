<%-- 
    Document   : update-product
    Created on : Oct 28, 2024, 3:35:29 PM
    Author     : 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal-dialog">
    <div class="modal-content">
        <form action="update-product" method="post">
            <div class="modal-header">
                <h4 class="modal-title">Edit Product</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label>Name</label>
                    <input name="id" type="hidden" class="form-control" value="${p.id}">
                    <input name="name" type="text" class="form-control" required value="${p.name}">
                </div>
                <div class="form-group">
                    <label>Image</label>
                    <input name="image" type="text" class="form-control" required value="${p.image}">
                </div>

                <div class="form-group">
                    <label>Price</label>
                    <input name="price" type="number" class="form-control" required min="0" value="${p.price}">
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" class="form-control" id="edit-des">${p.description}</textarea>
                </div>
                <div class="form-group">
                    <label>Amount</label>
                    <input name="amount" type="number" class="form-control" required min="0" value="${p.amount}">
                </div>
                <div class="form-group">
                    <label>Category</label>
                    <select name="category" class="form-control" aria-label="Default select example">
                        <c:forEach items="${listC}" var="o">
                            <option value="${o.id}" <c:if test="${p.cateID == o.id}">selected</c:if>>${o.name}</option>
                        </c:forEach>
                    </select>
                </div>

            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                <input type="submit" class="btn btn-info" value="Save">
            </div>
        </form>
    </div>
</div>

