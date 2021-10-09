<%@ page import="model.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/9/2021
  Time: 8:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Student</title>
</head>
<body>
<table border="1" style="border-collapse: collapse;text-align: left">
    <tr>
        <th>No</th>
        <th>ID</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Gender</th>
        <th>Grade</th>
    </tr>
<%
    List<Student> studentListJSP = (List<Student>) request.getAttribute("studentListServlet");
    for(Student student : studentListJSP){
%>
<tr>
    <td></td>
    <td><%=student.getId()%></td>
    <td><%=student.getName()%></td>
    <td><%=student.getDateOfBirth()%></td>
    <td>
        <% if(student.getGender()==1){%>
        Male
        <%} else {%>
        Female <%
        }
        %>
    </td>
        <td><%=student.getGrade()%></td>
</tr>
    <%}
    %>
</table>
</body>
</html>
