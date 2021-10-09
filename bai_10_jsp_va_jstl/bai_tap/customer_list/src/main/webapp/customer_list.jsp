<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/9/2021
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <style>
        img{
            width: 120px;
            height: 100px;
        }
    </style>
</head>
<body>
    <table border="1" style="border-collapse: collapse;text-align: left">
        <h2>Danh sách khách hàng</h2>
        <tr>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach var="customer" items="${customerListServlet}">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.dateOfBirth}</td>
                <td>${customer.address}</td>
                <td><img src="<c:url value="${customer.image}"/>"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
