<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/11/2021
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <p>Name:</p>
    <input type="text" name="name" value="${student.name}">
    <p>Date Of Birth:</p>
    <input type="text" name="dateOfBirth" value="${student.dateOfBirth}">
    <input type="submit" value="Update">
</form>
</body>
</html>
