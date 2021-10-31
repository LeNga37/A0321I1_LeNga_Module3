<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/30/2021
  Time: 12:22 AM
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
            <label for="serviceName">Service Name</label>
            <input type="text" class="form-control" id="serviceName" name="serviceName">
        </div>
        <div class="form-group">
            <label for="serviceArea">ServiceArea</label>
            <input type="number" class="form-control" id="serviceArea" name="serviceArea">
        </div>
        <div class="form-group">
            <label for="serviceCost">ServiceCost</label>
            <input type="number" class="form-control" id="serviceCost" name="serviceCost">
        </div>
        <div class="form-group">
            <label for="serviceMaxPeople">ServiceMaxPeople</label>
            <input type="number" class="form-control" id="serviceMaxPeople" name="serviceMaxPeople">
        </div>
        <div class="form-group">
            <label for="serviceTypeId">ServiceType</label>
            <select class="custom-select custom-select-sm" id="serviceTypeId" name="serviceTypeId">
                <option selected>ServiceType</option>
                <option value="1">year</option>
                <option value="2">month</option>
                <option value="3">day</option>
                <option value="4">hour</option>
            </select>
        </div>
        <div class="form-group">
            <label for="rentTypeId">RentType</label>
            <select class="custom-select custom-select-sm" id="rentTypeId" name="rentTypeId">
                <option selected>RentType</option>
                <option value="1">villa</option>
                <option value="2">house</option>
                <option value="3">room</option>
            </select>
        </div>
        <div class="form-group">
            <label for="standardRoom">StandardRoom</label>
            <input type="text" class="form-control" id="standardRoom" name="standardRoom">
        </div>
        <div class="form-group">
            <label for="descriptionConvenience">DescriptionConvenience</label>
            <input type="text" class="form-control" id="descriptionConvenience" name="descriptionConvenience">
        </div>
        <div class="form-group">
            <label for="poolArea">PoolArea</label>
            <input type="text" class="form-control" id="poolArea" name="poolArea">
        </div>
        <div class="form-group">
            <label for="numberFloor">NumberFloor</label>
            <input type="text" class="form-control" id="numberFloor" name="numberFloor">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="/furama/service" class="btn btn-primary">Back to list</a>
    </form>
</div>
<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>