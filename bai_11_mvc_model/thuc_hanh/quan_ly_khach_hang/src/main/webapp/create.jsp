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
    <title>Add new customer</title>
</head>
<body>
<h3>Nhập thông tin khách hàng cần thêm mới</h3>
<form method="post">
    <p>Id:</p>
    <input type="text" name="id" placeholder="Enter id:">
    <p>Name:</p>
    <input type="text" name="name" placeholder="Enter name:">
    <p>Email:</p>
    <input type="text" name="email" placeholder="Enter email:">
    <p>Address:</p>
    <input type="text" name="address" placeholder="Enter address:"><br/>
    <div style="margin-top: 5px">
        <input type="submit" value="Add">
        <button type="button"><a href="/customer">Back to list</a></button>
    </div>
</form>
</body>
</html>
