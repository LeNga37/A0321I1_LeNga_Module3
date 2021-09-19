create database bai_4_ham_thong_dung_trong_sql;
use bai_4_ham_thong_dung_trong_sql;

create table students(
student_number int not null auto_increment primary key,
student_name varchar(50) not null,
student_age int not null,
course varchar(255) not null,
total int not null
);

insert into students (student_name, student_age,course,total)
values
('Hoang', 21, 'CNTT', 400000),
('Viet', 19, 'DTVT', 320000),
('Thanh', 18, 'KTDN', 400000),
('Nhan', 19, 'CK', 450000),
('Huong', 20, 'TCNH', 500000),
('Huong', 20, 'TCNH', 200000);

-- Viết câu lệnh hiện thị tất cả các dòng có tên là Huong
select * from students
where student_name='Huong';

-- Viết câu lệnh lấy ra tổng số tiền của Huong
select sum(total) as total_Huong from students
where student_name='Huong';

-- Viết câu lệnh lấy ra tên danh sách của tất cả học viên, không trùng lặp
select student_name from students
group by student_name;