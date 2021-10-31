<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/30/2021
  Time: 9:27 PM
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
<form method="post">
    <div class="container">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="employeeName" value="${employee.employeeName}">
        </div>
        <div class="form-group">
            <label for="birthday">Birthday</label>
            <input type="text" class="form-control" id="birthday" name="employeeBirthDay"
                   value="${employee.employeeBirthDay}">
        </div>
        <div class="form-group">
            <label for="employeeIdCard">IdCard</label>
            <input type="text" class="form-control" id="employeeIdCard" name="employeeIdCard"
                   value="${employee.employeeIdCard}">
        </div>
        <div class="form-group">
            <label for="employeeSalary">Salary</label>
            <input type="number" class="form-control" id="employeeSalary" name="employeeSalary"
                   value="${employee.employeeSalary}">
        </div>
        <div class="form-group">
            <label for="employeePhone">Phone</label>
            <input type="text" class="form-control" id="employeePhone" name="employeePhone"
                   value="${employee.employeePhone}">
        </div>
        <div class="form-group">
            <label for="employeeEmail">Email</label>
            <input type="email" class="form-control" id="employeeEmail" name="employeeEmail"
                   value="${employee.employeeEmail}">
        </div>
        <div class="form-group">
            <label for="employeeAddress">Address</label>
            <input type="text" class="form-control" id="employeeAddress" name="employeeAddress"
                   value="${employee.employeeAddress}">
        </div>

        <div class="form-group">
            <label for="positionId">Position Id</label>
            <select class="custom-select custom-select-sm" id="positionId" name="positionId"
                    value="${employee.positionId}">
                <%--                <option selected>Gender</option>--%>
                <option value="1">Le_Tan</option>
                <option value="2">Phuc_Vu</option>
                <option value="3">Chuyen_Vien</option>
                <option value="4">Giam_Sat</option>
                <option value="5">Quan_Ly</option>
                <option value="6">Giam_Doc</option>
            </select>
        </div>
        <div class="form-group">
            <label for="educationDegreeId">Education Degree Id</label>
            <select class="custom-select custom-select-sm" id="educationDegreeId" name="educationDegreeId"
                    value="${employee.educationDegreeId}">
                <%--                <option selected>Customer Type</option>--%>
                <option value="1">Trung_Cap</option>
                <option value="2">Cao_Dang</option>
                <option value="3">Dai_Hoc</option>
                <option value="4">Sau_Dai_Hoc</option>
            </select>
        </div>
        <div class="form-group">
            <label for="divisionId">Division Id</label>
            <select class="custom-select custom-select-sm" id="divisionId" name="divisionId"
                    value="${employee.divisionId}">
                <%--                <option selected>Customer Type</option>--%>
                <option value="1">Sale_Marketing</option>
                <option value="2">Hanh_Chinh</option>
                <option value="3">Phuc_Vu</option>
                <option value="4">Phuc_Vu</option>
            </select>
        </div>
        <div class="form-group">
            <label for="userName">userName</label>
            <input type="text" class="form-control" id="userName" name="userName"
                   value="${employee.userName}">
        </div>
<%--        <div class="form-group">--%>
<%--            <label for="userName">userName</label>--%>
<%--            <select class="custom-select custom-select-sm" id="userName" name="userName"--%>
<%--                    value="${employee.userName}">--%>
                <%--                <option selected>Customer Type</option>--%>
<%--                <option value="1">Nga</option>--%>
<%--                <option value="2">Hang</option>--%>
<%--                <option value="3">Thanh</option>--%>
<%--            </select>--%>
<%--        </div>--%>
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="/furama/employee" class="btn btn-primary">Back to list</a>
    </div>
</form>
<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>
