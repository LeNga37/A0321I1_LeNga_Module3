SELECT*FROM classicmodels.customers;
SELECT*FROM classicmodels.customers WHERE customerName='Atelier graphique';
SELECT*FROM classicmodels.customers WHERE customerName LIKE '%A%';
SELECT*FROM classicmodels.customers WHERE city IN (
'Nantes','Warszawa','Paris'
);

SELECT*FROM classicmodels.orders;
SELECT*FROM classicmodels.orders WHERE oderNumber BETWEEN 10100 AND 10110;
SELECT*FROM classicmodels.orders WHERE oderDate <= 2003-03-03;-- chua dung
SELECT*FROM classicmodels.orders WHERE status LIKE '%shipped%';
