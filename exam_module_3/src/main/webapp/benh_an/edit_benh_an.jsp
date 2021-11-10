<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/31/2021
  Time: 1:25 PM
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
        <h3>Sửa thông tin bệnh án</h3>
        <div class="form-group">
            <label for="idBenhAn">Mã bệnh án</label>
            <input type="text" class="form-control" id="idBenhAn" name="idBenhAn" value="${benhAn.idBenhAn}" disabled>
        </div>
        <div class="form-group">
            <label for="idBenhNhan">Mã bệnh nhân</label>
            <input type="text" class="form-control" id="idBenhNhan" name="idBenhNhan" value="${benhAn.idBenhNhan}" disabled>
        </div>

        <div class="form-group">
            <label for="tenBenhNhan">Tên bệnh nhân</label>
            <input type="text" class="form-control" id="tenBenhNhan" name="tenBenhNhan" value="${benhAn.tenBenhNhan}">
        </div>

        <div class="form-group">
            <label for="ngayNhapVien">Ngày nhập viện</label>
            <input type="date" class="form-control" id="ngayNhapVien" name="ngayNhapVien" value="${benhAn.ngayNhapVien}">
        </div>

        <div class="form-group">
            <label for="ngayRaVien">Ngày ra viện</label>
            <input type="date" class="form-control" id="ngayRaVien" name="ngayRaVien" value="${benhAn.ngayRaVien}">
        </div>

        <div class="form-group">
            <label for="lyDoNhapVien">Ngày ra viện</label>
            <input type="text" class="form-control" id="lyDoNhapVien" name="lyDoNhapVien" value="${benhAn.lyDoNhapVien}">
        </div>

        <button type="submit" class="btn btn-primary">Sửa</button>
        <a href="/benhan" class="btn btn-primary">Trở về danh sách</a>
    </div>
</form>
<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>
