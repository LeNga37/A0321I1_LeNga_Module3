use classicmodels;

-- Tạo Mysql Stored Procedure đầu tiên
delimiter //
create procedure findAllCustomers()
begin
select * from customers;
end //
delimiter ;

-- Cách gọi procedure
call findAllCustomers();

-- Sửa procedure: xoa va tao lai
-- Xoa procedure
delimiter //
drop procedure if exists `findAllCustomers`//
create procedure findAllCustomers()
begin
select * from customers where cutomerNumber=175;
end; //
delimiter 



