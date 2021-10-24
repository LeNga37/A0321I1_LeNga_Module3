drop database users;
create database users;
use users;

create table users (
id int not null auto_increment primary key,
name varchar(120) not null,
email varchar(220) not null,
country varchar(120)
);

create table user_permision(
user_id int,
permision_id int
);

create table permision(
permision_id int,
name varchar(50)
);

insert into users(name, email, country)
values
('Minh','minh@codegym.vn','Viet Nam'),
('Hung','hung@codegym.vn','Viet Nam'),
('Tanaka','tanaka@codegym.vn','Japan'),
('Mike','mike@gmail.com','USA'),
('Sada','sada@gmail.com','Japan'),
('Sam','sam@gmail.com','UK'),
('Hai','hai@codegym.vn','Viet Nam');

-- insert into Permision(name) values('add');
-- insert into Permision(name) values('edit');
-- insert into Permision(name) values('delete');
-- insert into Permision(name) values('view');

delimiter //
create procedure get_user_by_id (in id int)
begin
	select users.name, users.email, users.country
    from users where users.id = id;
    end//
delimiter ;
call get_user_by_id(1);

delimiter //
create procedure insert_user (
in name varchar(120),
email varchar(220),
country varchar(120)
)
begin
	insert into users(name, email, country) values(name, email, country);
    end//
delimiter ;
call insert_user();


