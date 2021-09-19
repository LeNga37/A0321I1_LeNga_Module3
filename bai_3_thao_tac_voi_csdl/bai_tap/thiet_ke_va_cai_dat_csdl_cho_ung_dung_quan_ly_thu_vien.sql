drop database bai_3_library;
create database bai_3_library;
use bai_3_library;

create table categorys(
category_number int not null primary key,
category_name varchar(255) not null
);

create table borrow_orders(
borrow_order_id int not null primary key,
borrow_date date,
return_date date
);

create table books(
book_number int not null primary key,
book_name varchar(255) not null,
category_number int not null,
constraint book_pk1 foreign key (category_number) references categorys (category_number),
borrow_order_id int not null,
constraint book_pk2 foreign key (borrow_order_id) references borrow_orders(borrow_order_id)
);

create table students(
student_number varchar(15) primary key,
student_name varchar(50) not null,
borrow_order_id int not null,
constraint student_pk foreign key (borrow_order_id) references borrow_orders(borrow_order_id),
address varchar(500) not null,
email varchar(50) not null,
phone_number varchar(50),
image binary
);

