CREATE TABLE customers(
	customer_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	full_name VARCHAR(50),
	address VARCHAR(225),
	email VARCHAR(50),
	phone_number VARCHAR(25)
);

CREATE TABLE accounts(
	account_number INT NOT NULL PRIMARY KEY,
	account_type VARCHAR (50),
	open_date DATE,
	balance FLOAT,
	customer_number INT,
	FOREIGN KEY (customer_number) REFERENCES customers(customer_number)
);

CREATE TABLE transactions (
    account_number INT NOT NULL PRIMARY KEY,
    tran_date DATE,
    amounts FLOAT NOT NULL,
    descriptions TEXT,
    FOREIGN KEY (account_number) REFERENCES accounts(account_number)
);