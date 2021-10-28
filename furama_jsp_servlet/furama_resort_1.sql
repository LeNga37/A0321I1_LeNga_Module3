create database furama_resort_1;
use furama_resort_1;

create table `position` (
	position_id int not null auto_increment primary key,
	position_name varchar(45)
);

create table education_degree (
	education_degree_id int not null auto_increment primary key,
	education_degree_name varchar(45)
);

create table division (
	division_id int not null auto_increment primary key,
	division_name varchar(45)
);

create table `role` (
	role_id int not null auto_increment primary key,
	role_name varchar(255)
);

create table `user` (
	username varchar(255) not null primary key,
	password varchar(255)
);

create table `user_role` (
	role_id int,
	username varchar(255),
    foreign key (role_id) references `role`(role_id),
	foreign key (username) references `user`(username)
);

create table customer_type(
	customer_type_id int not null auto_increment primary key,
    customer_type_name varchar(45)
);

create table servive_type(
	servive_type_id int not null auto_increment primary key,
    servive_type_name varchar(45)
);

create table rent_type(
	rent_type_id int not null auto_increment primary key,
    rent_type_name varchar(45),
    rent_type_cost double
);

create table service(
	service_id int not null auto_increment primary key,
    service_name varchar(45) not null,
    service_area int not null,
    service_cost double not null,
    service_max_people int not null,
    rent_type_id int default null,
    servive_type_id int default null,
    standard_room varchar(45) not null,
    description_other_convenience varchar(45) not null,
    poll_area double null,
    number_of_floors int null,
    foreign key (rent_type_id) references rent_type(rent_type_id),
	foreign key (servive_type_id) references servive_type(servive_type_id)
);

create table customer(
	customer_id int not null auto_increment primary key,
    customer_type_id int default null,
    customer_name varchar(45) not null,
    customer_birthday date not null,
    customer_gender bit(1) not null,
    customer_id_card varchar(45) not null,
    customer_phone varchar(45) not null,
    customer_email varchar(45) not null,
    customer_adress varchar(45) not null,
    foreign key (customer_type_id) references customer_type(customer_type_id)
);

create table employee (
employee_id int not null auto_increment primary key,
employee_name varchar(45) not null,
employee_birthday date not null,
employee_id_card varchar(45) not null,
employeer_salary double not null,
employeer_phone varchar(45) not null,
employee_email varchar(45) not null,
employee_adress varchar(45) not null,
position_id int default null,
education_degree_id int default null,
division_id int default null,
username varchar(255) default null,
foreign key (position_id) references `position`(position_id),
foreign key (education_degree_id) references education_degree(education_degree_id),
foreign key (division_id) references division(division_id),
foreign key (username) references `user`(username)
);

create table attach_service(
attach_service_id int not null auto_increment primary key,
attach_service_name varchar(45) not null,
attach_service_cost double not null,
attach_service_unit int not null,
attach_service_status varchar(45)
);

create table contract(
contract_id int not null auto_increment primary key,
contract_start_date date not null,
contract_end_date date not null,
contract_deposit double not null,
contract_total_money double not null,
employee_id int default null,
customer_id int default null,
service_id int default null,
foreign key (employee_id) references employee(employee_id),
foreign key (customer_id) references customer(customer_id),
foreign key (service_id) references service (service_id)
);

create table contract_detail(
contract_detail_id int not null auto_increment primary key,
contract_id int default null,
attach_service_id int default null,
quantity int not null,
foreign key (contract_id) references contract(contract_id),
foreign key (attach_service_id) references attach_service (attach_service_id)
);

