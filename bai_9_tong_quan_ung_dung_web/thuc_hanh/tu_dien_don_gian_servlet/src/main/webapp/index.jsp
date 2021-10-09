<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/8/2021
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Simple Dictionary</title>
  </head>
  <body>
  <h2>Vietnamese Dictionary</h2>
  <form method="post" action="/dictionary">
    <input type="text" name="txtSearch" placeholder="Enter your word: "/>
    <input type="submit" id="submit" value="Search"/>
  </form>
  </body>
</html>
