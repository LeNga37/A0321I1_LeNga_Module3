use classicmodels;
select *from customers;
-- tim kiem thong thuong
select * from customers where customerNumber=175;
explain select *from customers WHERE customerNumber=175;

-- them chi muc cho bang customers roi tim kiem
alter table customers add index idx_customerNumber(customerNumber);
explain select *from customers where customerNumber=175;

-- them index cho cot co nhieu hon 1 ket qua
alter table customers add index idx_full_namer(contactFirstName, contactLastName);
explain select *from customers where contactFirstName = 'Jean' or contactFirstName = 'King';

-- xoa index trong bang
alter table customers drop index idx_full_name;
