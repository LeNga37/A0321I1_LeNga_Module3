<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/16/2021
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container">
<%--    <a href="/product?action=search" class="btn btn-warning">Search By Name</a>--%>
    <form action="/product" method="get">
        <div class="mb-3" style="margin-top: 30px">
            <input type="hidden" name="action" value="search">
            <input type="text" class="form-control" placeholder="Enter name" id="inputName" name="searchName">
            <button type="submit" class="btn btn-primary">Search By Name</button>
        </div>
    </form>
<table id="product" class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Product ID</th>
        <th scope="col">Product Name</th>
        <th scope="col">Price</th>
        <th scope="col">Description</th>
        <th scope="col">Maker</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
        <th scope="col">Detail</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}">
    <tr>
        <td>${product.productId}</td>
        <td>${product.productName}</td>
        <td>${product.price}</td>
        <td>${product.description}</td>
        <td>${product.maker}</td>
        <td>
            <a href="/product?action=update&id=${product.productId}">Edit</a>
        </td>
        <td>
            <a href="/product?action=delete&id=${product.productId}">Delete</a>
        </td>
        <td>
            <a href="/product?action=detail&id=${product.productId}">Detail</a>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
    <a href="/product?action=create" class="btn btn-warning">Add new product</a>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#product').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        })
    })
</script>
</body>
</html>
