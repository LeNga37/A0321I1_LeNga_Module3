<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/12/2021
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete customer</title>
</head>
<body>
<h3>Xác nhận xóa khách hàng có thông tin</h3>
<form method="post">
    <p>Name:</p>
    <input type="text" name="name" value="${customer.name}">
    <p>Email:</p>
    <input type="text" name="email" value="${customer.email}">
    <p>Address:</p>
    <input type="text" name="address" value="${customer.address}"><br/>
    <div style="margin-top: 5px">
        <input type="submit" value="Delete">
        <button type="button"><a href="/customer">Back to list</a></button>
    </div>
</form>
</body>
</html>
