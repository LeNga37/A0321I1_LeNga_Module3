<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/8/2021
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator</title>
  </head>
  <body>
  <h2>Product Discount Calculator</h2>
  <form method="post" action="/display-discount">
    <input type="text" name="description" placeholder="Product Description: "/>
    <input type="number" name="price" placeholder="List Price: "/>
    <input type="number" name="percent" placeholder="Discount Percent: "/>
    <input type="submit" id = "submit" value="discount-price"/>
  </form>
  </body>
</html>
