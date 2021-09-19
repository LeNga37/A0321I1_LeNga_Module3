CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
address VARCHAR(255),
email VARCHAR(50) NOT NULL
);

CREATE TABLE orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
staff VARCHAR(50),
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customer (order_id)
);