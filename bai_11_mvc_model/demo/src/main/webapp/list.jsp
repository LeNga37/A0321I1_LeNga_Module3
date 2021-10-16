<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/11/2021
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Student JSTL</title>
</head>
<body>
<table border="1" style="border-collapse: collapse;text-align: left">
    <h2>List Student</h2>
    <tr>
        <th>No</th>
        <th>ID</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Gender</th>
        <th>Grade</th>
        <th>Edit</th>
    </tr>
    <%--    var: dai dien cho  phan tu o list //items: bien nhan duoc tu servlet--%>
    <c:forEach var="student" items="${studentListServlet}" varStatus="loop">
        <tr>
                <%--            cout: dem tu 1, index: dem tu 0, varStatus dat ten gi cung duoc--%>
            <td>${loop.count}</td>
                <%--            tuong duong voi student.getId vi jstl tu dong goi phuong thuc get tuong ung--%>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.dateOfBirth}</td>
            <td>
                <c:if test="${student.gender == 1}">
                    Male
                </c:if>
                <c:if test="${student.gender == 0}">
                    Female
                </c:if>
            </td>
                <%--            <td>${student.grade}</td>--%>
            <td>
                <c:choose>
                    <c:when test="${student.grade<5}">
                        Bad
                    </c:when>
                    <c:when test="${student.grade<8}">
                        Good
                    </c:when>
                    <c:otherwise>
                        Very good
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="/student?action=update&id=${student.id}">Edit</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
