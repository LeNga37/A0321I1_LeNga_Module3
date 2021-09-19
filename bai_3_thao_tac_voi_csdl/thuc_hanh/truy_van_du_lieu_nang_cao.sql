USE classicmodels;
SELECT productCode, productName, buyprice, quantityInStock FROM products
WHERE buyPrice > 56.76 AND quantityInStock >10;

SELECT productCode, productName, buyprice, textDescription FROM products
INNER JOIN productlines ON products.productLine=productlines.productLine
WHERE buyprice >55.56 AND buyprice <95.59;

SELECT productCode, productName, buyprice, quantityInStock, productVendor, productLine FROM products
WHERE productLine='Classic Cars' or productVendor = 'Min Lin Diecast';