<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/10/2021
  Time: 9:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <body>
  <form method="post" action="/calculator">
    <h2>Simple Calculator</h2>
    <div>
      <span>First operand: </span>
      <input type="number" name="number1">
    </div>
    <div>
      <span>Operator</span>
      <select name="operator">
        <option>Addition</option>
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
      </select>
    </div>
    <div>
      <span>Second operand: </span>
      <input type="number" name="number2">
    </div>
    <div>
      <input type="submit" value="Calculate">
    </div>
  </form>
  </body>
</html>
