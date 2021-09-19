
DROP DATABASE bai_2_phan_tich_thiet_ke_csdl;
CREATE DATABASE bai_2_phan_tich_thiet_ke_csdl;
USE bai_2_phan_tich_thiet_ke_csdl;

CREATE TABLE offices  (
office_code VARCHAR(10) NOT NULL PRIMARY KEY,
city VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
address_line1 VARCHAR(50) NOT NULL,
address_line2 VARCHAR(50) DEFAULT NULL,
state VARCHAR(50) NOT NULL,
postal_code VARCHAR(15) NOT NULL,
country VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
employee_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
job_title VARCHAR(50) NOT NULL,
report_to INT DEFAULT NULL,
CONSTRAINT employees_pk FOREIGN KEY(report_to) REFERENCES employees(employee_number),
office_code VARCHAR(10) NOT NULL,
CONSTRAINT employees_pk_1 FOREIGN KEY(office_code) REFERENCES offices(office_code)
);

CREATE TABLE customers(
customer_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
contact_lastname VARCHAR(50) NOT NULL,
contact_firstname VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
address_line1 VARCHAR(50) NOT NULL,
address_line2 VARCHAR(50) DEFAULT NULL,
city VARCHAR(50) NOT NULL,
state VARCHAR(50) NOT NULL,
postal_code VARCHAR(15) NOT NULL,
country  VARCHAR(50) NOT NULL,
credit_limit FLOAT DEFAULT NULL,
sales_rep_employee_number INT NOT NULL,
CONSTRAINT customers_pk FOREIGN KEY(sales_rep_employee_number) REFERENCES employees (employee_number)
);

CREATE TABLE orders(
order_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_number INT NOT NULL,
CONSTRAINT orders_pk FOREIGN KEY(customer_number) REFERENCES customers (customer_number),
order_date DATE NOT NULL,
required_date DATE NOT NULL,
shipped_date DATE DEFAULT NULL,
`status` VARCHAR(15) NOT NULL,
comments TEXT NOT NULL,
quantity_ordered INT NOT NULL,
price_each FLOAT NOT NULL
);

CREATE TABLE product_lines (
product_line VARCHAR(50) NOT NULL PRIMARY KEY,
text_description TEXT NOT NULL,
image VARCHAR(255) DEFAULT NULL
);

CREATE TABLE products (
product_code VARCHAR(15) NOT NULL PRIMARY KEY,
product_line VARCHAR(50) NOT NULL,
CONSTRAINT products_pk FOREIGN KEY(product_line) REFERENCES product_lines (product_line),
product_name VARCHAR(70) NOT NULL,
product_scale VARCHAR(10) NOT NULL,
product_vendor VARCHAR(50) NOT NULL,
product_description TEXT NOT NULL,
quantity_in_stock INT NOT NULL,
buy_price FLOAT NOT NULL,
MSRP FLOAT NOT NULL
);

CREATE TABLE order_details(
order_detail_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_number INT NOT NULL,
CONSTRAINT order_details1_pk FOREIGN KEY (order_number) REFERENCES orders(order_number),
product_code VARCHAR(15) NOT NULL,
CONSTRAINT order_details2_pk FOREIGN KEY (product_code) REFERENCES products(product_code)
);

CREATE TABLE payments (
customer_number INT NOT NULL,
CONSTRAINT payments_pk FOREIGN KEY(customer_number) REFERENCES customers (customer_number),
check_number VARCHAR(50) NOT NULL,
payment_date DATE NOT NULL,
amount FLOAT NOT NULL
);
