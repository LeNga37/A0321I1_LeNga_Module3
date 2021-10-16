<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/12/2021
  Time: 9:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
</head>
<body>
<form method="post">
    <p>Name:</p>
    <input type="text" name="name" value="${customer.name}">
    <p>Email:</p>
    <input type="text" name="email" value="${customer.email}">
    <p>Address:</p>
    <input type="text" name="address" value="${customer.address}">
    <button type="button"><a href="/customer">Back to list</a></button>
</form>
</body>
</html>
