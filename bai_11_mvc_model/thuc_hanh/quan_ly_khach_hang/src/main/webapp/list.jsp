<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/12/2021
  Time: 9:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>
</head>
<body>
<table border="1" style="border-collapse: collapse;text-align: left">
    <h2>List Customer</h2>
    <tr>
        <th>No</th>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Detail</th>
    </tr>
    <c:forEach var="customer" items="${customerListServlet}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td>
                <a href="/customer?action=update&id=${customer.id}">Edit</a>
            </td>
            <td>
                <a href="/customer?action=delete&id=${customer.id}">Delete</a>
            </td>
            <td>
                <a href="/customer?action=detail&id=${customer.id}">Detail</a>
            </td>
        </tr>
    </c:forEach>
</table>
<button type="button" style="margin-top: 10px"><a href="/customer?action=create">Add new customer</a></button>
</body>
</html>
