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

delimiter //
create procedure find_all_user ()
begin
	select * from users;
end//
delimiter ;


delimiter //
create procedure update_user (
in id int, 
in new_name varchar(120), 
in new_email varchar(220), 
in new_country varchar(120)
)
begin
	update users
    set users.name = new_name,
    users.email = new_email,
    users.country = new_country
    where users.id = id;
end//
delimiter ;
-- call update_user();

delimiter //
create procedure delete_user(in id int)
begin 
	delete users
    from users
    where users.id = id;
end //
delimiter ;