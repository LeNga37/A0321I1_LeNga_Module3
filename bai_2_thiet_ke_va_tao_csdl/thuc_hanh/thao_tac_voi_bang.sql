-- Create
CREATE TABLE contacts (
contact_id INT NOT NULL AUTO_INCREMENT,
last_name VARCHAR(30) NOT NULL,
first_name VARCHAR(25),
birthday DATE,
CONSTRAINT contacts_pk PRIMARY KEY(contact_id)
);

CREATE TABLE suppliers (
supplier_id INT NOT NULL AUTO_INCREMENT,
supplier_name VARCHAR(50) NOT NULL,
suppier_name VARCHAR(50) NOT NULL,
account_rep VARCHAR(30) NOT NULL DEFAULT 'TBD',
CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);

-- Alter
-- add one column 
ALTER TABLE contacts 
ADD contact_type VARCHAR(40) NOT NULL
AFTER contact_id;

-- add two column 
ALTER TABLE contacts 
ADD address VARCHAR(40) NOT NULL 
AFTER birthday,
ADD phone_number VARCHAR(40) NOT NULL
AFTER address;

-- thay doi kdl
ALTER TABLE contacts
MODIFY last_name VARCHAR(50) NULL;

-- thay doi kdl, vi tri
ALTER TABLE contacts
MODIFY address VARCHAR(50)
AFTER first_name;

-- chande column name
ALTER TABLE contacts
CHANGE COLUMN contact_type ctype
VARCHAR(30) NOT NULL;

-- drop column
ALTER TABLE contacts
DROP COLUMN ctype;

-- change table name
ALTER TABLE contacts
RENAME TO people;


-- drop
DROP TABLE contacts;
DROP TABLE suppliers;
