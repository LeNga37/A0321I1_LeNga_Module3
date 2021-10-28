<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/27/2021
  Time: 8:58 PM
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
    <form method="post">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="customerName">
        </div>
        <div class="form-group">
            <label for="birthday">Birthday</label>
            <input type="text" class="form-control" id="birthday" name="customerBirthday">
        </div>
        <div class="form-group">
            <label for="gender">Gender</label>
            <select class="custom-select custom-select-sm" id="gender" name="customerGender">
                <option selected>Gender</option>
                <option value="1">Male</option>
                <option value="2">Female</option>
            </select>
        </div>
        <div class="form-group">
            <label for="idCard">Id card</label>
            <input type="text" class="form-control" id="idCard" name="customerIdCard">
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" class="form-control" id="phone" name="customerPhone">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" class="form-control" id="email" name="customerEmail">
        </div>
        <div class="form-group">
            <label for="customerTypeId">Customer type id</label>
<%--            <input type="number" class="form-control" id="customerTypeId" name="customerTypeId">--%>
            <select class="custom-select custom-select-sm" id="customerTypeId" name="customerTypeId">
                <option selected>Customer Type</option>
                <option value="1">Diamond</option>
                <option value="2">Platinum</option>
                <option value="3">Gold</option>
                <option value="4">Silver</option>
                <option value="5">Member</option>
            </select>
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" name="customerAddress">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="/furama/customer" class="btn btn-primary">Back to list</a>
    </form>
</div>
<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>
