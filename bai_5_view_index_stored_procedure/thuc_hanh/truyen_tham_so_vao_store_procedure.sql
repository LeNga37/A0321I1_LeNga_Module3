use classicmodels;
-- ham so loai in
delimiter //
create procedure getCusById (in cusNum int(11))
begin
select * from customers where customerNumber = cusNum;
end //
delimiter ;
call getCusById(175);

-- tham so loai out
delimiter //
create procedure GetCustomersCountByCity(in in_city varchar(50), out total int)
begin
select count(customerNumber) into total from customers where city=in_city;
end //
delimiter ;
call GetCustomersCountByCity('Lyon',@total);
select @total;

-- tham so loai inout
delimiter //
create procedure SetCounter(inout counter int, in inc int)
begin
set counter = counter + inc;
end //
delimiter ;
set @counter = 1;
call SetCounter(@counter,1);
call SetCounter(@counter,1);
call SetCounter(@counter,8);
select @counter;

-- drop procedure SetCounter;