use classicmodels;
-- tao view
create view customer_views as 
select customers.customerNumber, customers.customerName, customers.phone 
from customers;
select * from customer_views;

-- update view
create or replace view customer_views as 
select customers.customerNumber, customers.customerName, customers.contactFirstName, customers.contactLastName, customers.phone
from customers
where city= 'Nantes';

-- xoa view
drop view customer_views;

   
