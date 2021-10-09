<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/9/2021
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple dictionary</title>
</head>
<body>
    <%!
        Map<String, String> dictionary = new HashMap<>();
    %>

    <%
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển vở");
        dictionary.put("computer", "Máy tính");

        String search = request.getParameter("txtSearch");

        String result = dictionary.get(search);
        
        if (result != null) {
            out.println("Word: " + search);
            out.println("Result: " + result);
        } else {
            out.println("Not found");
        }
    %>
</body>
</html>
