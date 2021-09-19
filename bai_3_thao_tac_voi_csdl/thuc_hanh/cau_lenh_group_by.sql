USE classicmodels;

SELECT status FROM orders
GROUP BY status;

SELECT status, COUNT(*) AS 'So luong status'
FROM orders GROUP BY status;

SELECT status, SUM(quantityOrdered * priceEach) AS amount FROM  orders
INNER JOIN orderdetails  ON orders.orderNumber = orderdetails.ordernumber
GROUP BY status;

SELECT orderNumber, SUM(quantityOrdered * priceEach) as total FROM orderdetails
GROUP BY orderNumber;

SELECT year(orderDate) AS year, SUM(quantityOrdered * priceEach) as total
FROM orders
INNER JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
WHERE status ='shipped'
GROUP BY year
HAVING year>2003;