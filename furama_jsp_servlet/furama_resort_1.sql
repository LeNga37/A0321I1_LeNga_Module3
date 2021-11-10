drop database furama_resort_1;
create database furama_resort_1;
use furama_resort_1;
create table `position` (
	position_id int not null auto_increment primary key,
	position_name varchar(45)
);
insert into `position`(position_name) values
 ('Le_Tan'),('Phuc_Vu'),('Chuyen_Vien'),('Giam_Sat'),('Quan_Ly'),('Giam_Doc');
 
create table education_degree (
	education_degree_id int not null auto_increment primary key,
	education_degree_name varchar(45)
);
insert into education_degree(education_degree_name) values
('Trung_Cap'),('Cao_Dang'),('Dai_Hoc'),('Sau_Dai_Hoc');

create table division (
	division_id int not null auto_increment primary key,
	division_name varchar(45)
);
insert into division(division_name) values
('Sale_Marketing'),('Hanh-Chinh'),('Phuc_Vu'),('Quan_Ly');

create table `role` (
	role_id int not null auto_increment primary key,
	role_name varchar(255)
);
insert into `role`(role_name) values
('admin'),('user');

create table `user` (
	username varchar(255) not null primary key,
	`password` varchar(255)
);
insert into `user`(username,`password`) values
('Nga','abc12345'),('Hang','abc123456'),('Thanh','abc1234567');

create table user_role (
	role_id int,
	username varchar(255),
    foreign key (role_id) references `role`(role_id) on update cascade on delete cascade,
	foreign key (username) references `user`(username) on update cascade on delete cascade
);
insert into user_role(role_id,username) values
(1,'Nga'),(2,'Hang'),(1,'Thanh');

create table customer_type(
	customer_type_id int not null auto_increment primary key,
    customer_type_name varchar(45)
);
insert into customer_type(customer_type_name) values
('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');

create table service_type(
	service_type_id int not null auto_increment primary key,
    service_type_name varchar(45)
);
insert into service_type(service_type_name) values
('villa'),('house'),('room');

create table rent_type(
	rent_type_id int not null auto_increment primary key,
    rent_type_name varchar(45),
    rent_type_cost double
);
insert into rent_type(rent_type_name,rent_type_cost) values
('year',20000000),('month',2500000),('day',350000),('hour',200000);

create table service(
	service_id int not null auto_increment primary key,
    service_name varchar(45) not null,
    service_area int not null,
    service_cost double not null,
    service_max_people int not null,
    rent_type_id int default null,
    service_type_id int default null,
    standard_room varchar(45) not null,
    description_other_convenience varchar(45) default null,
    pool_area double default null,
    number_of_floors int null,
    foreign key (rent_type_id) references rent_type(rent_type_id) on delete cascade,
	foreign key (service_type_id) references service_type(service_type_id) on delete cascade
);
insert into service(service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,
standard_room,description_other_convenience,pool_area,number_of_floors) values
('Villa1',300,20000000,15,1,1,'moi','near river',50,3),
('Villa2',400,25000000,15,2,3,'moi',null,50,3),
('Room',45,20000000,3,1,1,'moi',null,50,1),
('House',100,20000000,9,3,1,'moi','wifi',null,2);


create table customer(
	customer_id int not null auto_increment primary key,
    customer_type_id int default null,
    customer_name varchar(45) not null,
    customer_birthday date not null,
    customer_gender bit(1) not null,
    customer_id_card varchar(45) not null,
    customer_phone varchar(45) not null,
    customer_email varchar(45) not null,
    customer_address varchar(45) not null,
    foreign key (customer_type_id) references customer_type(customer_type_id) on update cascade on delete cascade
);
insert into customer
(customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,
customer_email,customer_address) values
(1,'Tran Van Bao','1990-05-09',1,'12343577326534','0987652431','tranvanbao@gmail.com','Da Nang'),
(2,'Tran Ba Minh','1980-12-15', 1,'135722376534','0129525794','baminh@gmail.com','Hung Yen'),
(4,'Nguyen Tran Nhat Khang','1993-06-29', 1,'125776534','0392174902','nhatkhang@gmail.com','Khanh Hoa'),
(5,'Le Minh Huy','1995-02-03', 0,'1234357567534','0962692790','tranminhhuy@gmail.com','Nghe An'),
(3,'Phan Nhat Anh','1992-09-12', 1,'1234357234534','0981357368','nhatanh@gmail.com','Quang Tri'),
(2,'Le Van Quoc Trung','1994-07-15', 0,'123345776534','0981234900','quoctrung@gmail.com','Hai Duong');

create table employee (
employee_id int not null auto_increment primary key,
employee_name varchar(45) not null,
employee_birthday date not null,
employee_id_card varchar(45) not null,
employee_salary double not null,
employee_phone varchar(45) not null,
employee_email varchar(45) not null,
employee_address varchar(45) not null,
position_id int default null,
education_degree_id int default null,
division_id int default null,
username varchar(255) default null,
foreign key (position_id) references `position`(position_id) on update cascade on delete cascade,
foreign key (education_degree_id) references education_degree(education_degree_id) on update cascade on delete cascade,
foreign key (division_id) references division(division_id) on update cascade on delete cascade,
foreign key (username) references `user`(username) 
);
insert into employee
(employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,
employee_address,position_id,education_degree_id,division_id,username) values
('Nguyen Van Bach', '1991-03-04','987245824','7500000','0127482937','nguyenvanbach@gmail.com','Da Nang', 1, 3, 2,'Nga'),
('Nguyen Hoang Anh', '1988-09-26','754825582','9000000','0895349357','nguyenhoanganh@gmail.com','Quang Binh', 3, 3, 4,'Nga'),
('Le Truc Diem', '1999-01-28','445274527','5800000','0376728167','letrucdiem@gmail.com','Quang Tri', 2, 1, 3,'Thanh'),
('Tran Quoc Minh', '1993-02-01','972514304','14500000','0957182507','tranquocminh@gmail.com','Thua Thien Hue', 5, 4, 4,'Nga'),
('Le Bao Binh', '1989-06-19','673548264','9300000','0371835477','lebaobinh@gmail.com','Nghe An', 4, 2, 4,'Nga'),
('Pham Minh Tuyet', '1983-09-08','736492640','20500000','0384274999','phamminhtuyet@gmail.com','Da Nang', 6, 4, 4,'Thanh'), -- giam doc
('Phan Tuong Vy', '1995-02-18','075374926','8800000','0906556182','phantuongvy@gmail.com','Quang Tri', 3, 3, 1,'Nga'),
('Nguyen Ba Vinh', '2000-05-27','012839475','5400000','0827364758','nguyenbavinh@gmail.com','Quang Ngai', 2, 1, 3,'Hang');

create table attach_service(
attach_service_id int not null auto_increment primary key,
attach_service_name varchar(45) not null,
attach_service_cost double not null,
attach_service_unit int not null,
attach_service_status varchar(45)
);
insert into attach_service(attach_service_name, attach_service_cost, attach_service_unit, attach_service_status) values
('massage', 200000, 100, 'full'),
('karaoke', 350000, 10, 'full'),
('thuc an', 300000, 300, 'full'),
('nuoc uong', 10000, 1000, 'full'),
('thue xe', 250000, 50, 'still');

create table contract(
contract_id int not null auto_increment primary key,
contract_start_date date not null,
contract_end_date date not null,
contract_deposit double not null,
contract_total_money double not null,
employee_id int default null,
customer_id int default null,
service_id int default null,
foreign key (employee_id) references employee(employee_id) on update cascade on delete cascade,
foreign key (customer_id) references customer(customer_id) on update cascade on delete cascade,
foreign key (service_id) references service (service_id) on update cascade on delete cascade
);
insert into contract(contract_start_date,contract_end_date,contract_deposit,contract_total_money,employee_id, customer_id,service_id) 
values
('2018-09-03','2018-09-03',2000000,20000000,1, 1, 1),
('2021-02-15','2021-03-15',500000,2500000,7, 5, 3),
('2021-08-18','2021-08-18',200000,200000,2, 2, 4),
('2020-06-03','2021-06-03',3500000,20000000,3, 2, 1),
('2021-05-01','2021-05-01',500000,2500000,4, 3, 3),
('2021-09-20','2021-09-20',200000,200000,7, 6, 2),
('2021-12-12','2022-12-12',4000000,20000000,8, 4, 1);

create table contract_detail(
contract_detail_id int not null auto_increment primary key,
contract_id int default null,
attach_service_id int default null,
quantity int not null,
foreign key (contract_id) references contract(contract_id) on update cascade on delete cascade,
foreign key (attach_service_id) references attach_service (attach_service_id) on update cascade on delete cascade
);
insert into contract_detail(contract_id,attach_service_id,quantity) values
(1,2,1), (2,1,3), (3,3,1), (4,4,10), (5,5,1), (6,3,3),(7,4,3);