/*
====================================================
01_create_tables.sql
Project: DataShop
Description: Creates the relational databese structure including
tables, primary keys and foreign key constraints.

The schema models a transactional e-commerce system
with customers, products, orders and order items.
====================================================
*/

-- -------------------------------------------------
-- Database creation
-- -------------------------------------------------
CREATE DATABASE IF NOT EXISTS datashop;

-- -------------------------------------------------
-- Select database for use
-- -------------------------------------------------
USE datashop;

-- -------------------------------------------------
-- Table: customers
-- Stores customer registration information
-- -------------------------------------------------
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique customer identifier
    full_name VARCHAR(100) NOT NULL,            -- Customer full name
    email VARCHAR(100) UNIQUE,                  -- Unique email for each customer
    state CHAR(2),                              -- State (UF)
    registration_date DATE                      -- Customer registration date
);

-- -------------------------------------------------    
-- Table: products
-- Contains products available for sale
-- -------------------------------------------------
CREATE TABLE products(
    product_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique product identifier
    product_name VARCHAR(100) NOT NULL,        -- Product name
    category VARCHAR(50),                      -- Produto category
    price DECIMAL(10,2) NOT NULL               -- Unit price of the product
);

-- -------------------------------------------------
-- Table: orders
-- Represents orders placed by customers
-- Relationship: one customer can have multiple orders (1:N)
-- -------------------------------------------------
CREATE TABLE orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique order identifier
    customer_id INT NOT NULL,                  -- Customer who placed the order
    order_date DATE,                           -- Order date
    total_amount DECIMAL(10,2),                -- Total order value
    
    CONSTRAINT fk_orders_customer
		FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- -------------------------------------------------
-- Table: order_items
-- Details the product included in each order
-- Resolves many-to-many relationship between orders and products (N:N)
-- -------------------------------------------------
CREATE TABLE order_items(
    item_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique item identifier
    order_id INT NOT NULL,                     -- Order to which the item belongs
    product_id INT NOT NULL,                   -- Sold product
    quantity INT NOT NULL,                     -- Product quantity
    unit_price DECIMAL(10,2) NOT NULL,         -- Product price at the time of sale
    
    CONSTRAINT fk_order_items_orders
	FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
        
	CONSTRAINT fk_order_items_products
	FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);