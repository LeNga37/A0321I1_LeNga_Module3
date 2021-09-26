drop database bai_5_view_index_store_procedure;
create database bai_5_view_index_store_procedure;
use bai_5_view_index_store_procedure;

create table products(
product_id int auto_increment not null primary key,
product_code varchar(25) not null,
product_name varchar(255) not null,
product_price float not null,
product_amount int not null,
product_description varchar(255),
product_status varchar(255)
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values
('SP_5','Iphone5',3000000,3,'new','USA'),
('SP_5s','Iphone5s',4000000,3,'new','USA'),
('SP_6','Iphone6',5000000,3,'new','USA'),
('SP_6s','Iphone6s',6000000,3,'new','USA'),
('SP_7','Iphone7',7000000,3,'new','USA'),
('SP_8','Iphone8',8000000,3,'new','USA'),
('SP_9','Iphone9',9000000,3,'new','USA');

-- index
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_product_code on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table products add index index_name_price(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_code='SP_6';
explain select * from products where product_code='SP_6' or product_price = 5000000;

-- view
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_views as
select product_code, product_name,product_price,product_status
from products;
select * from products_views;

-- Tiến hành sửa đổi view
create or replace view products_views as
select product_code, product_name,product_price,product_status
from products
where product_name = 'iphone5';
select * from products_views;

-- Tiến hành xoá view
drop view products_views;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure findAllProducts()
begin
	select * from products;
end //
delimiter ;
call findAllProducts();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addProduct()
begin
	insert into products(product_code,product_name,product_price,product_amount,product_description,product_status) 
    values ('SP_10','Iphone10',10000000,5,'new','USA');
end //
delimiter ;
call addProduct();
select * from products;

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure updateProduct(in product_id int, in product_new_price int)
begin
	update products
    set products.product_price=product_new_price
    where products.product_id=product_id;
end //
delimiter ;
call updateProduct(1,3500000);
select * from products;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure deleteProduct(in product_id int)
begin 
	delete products
    from products
    where products.product_id = product_id;
end //
delimiter //
call deleteProduct(1);
select * from products;
 