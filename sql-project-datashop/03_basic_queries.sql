/*
====================================================
03_basic_queries.sql
Project: DataShop
Description: Initial data exploration and validation queries.

Purpose:
- Validate data consistency
- Explore data distribution
- Perform basic aggregations
- Prepare foundation for intermediate analysis
====================================================
*/

-- -------------------------------------------------
-- Check total number of records in each table
-- -------------------------------------------------
SELECT COUNT(*) AS total_customer FROM customers;
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_order_items FROM order_items;

-- -------------------------------------------------
-- Preview data from each table
-- -------------------------------------------------
SELECT * FROM customers LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM order_items LIMIT 10;

-- -------------------------------------------------
-- Number of clients by state
-- -------------------------------------------------
SELECT 
	state, 
    COUNT(*) AS total_clients
FROM customers
GROUP BY state
ORDER BY total_clients DESC;

-- -------------------------------------------------
-- Number of products by category
-- -------------------------------------------------
SELECT 
	category, 
    COUNT(*) AS total_product
FROM products
GROUP BY category
ORDER BY total_product DESC;

-- -------------------------------------------------
-- Number of orders grouped by month
-- Used to identify early sign of seasonality
-- -------------------------------------------------
SELECT 
	MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY total_orders DESC;

-- -------------------------------------------------
-- Calculates total revenue to validate financial consistency
-- -------------------------------------------------
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- -------------------------------------------------
-- Average order value (Average Ticket)
-- -------------------------------------------------
SELECT AVG(total_amount) AS avg_order_value
FROM orders;

-- -------------------------------------------------
-- Basic price validation
-- Checks minimum, maximum and average product prices
-- Ensures no unrealistic price outliers exists
-- -------------------------------------------------
SELECT
	MIN(price) AS min_price, 
    MAX(price) AS max_price,
    AVG(price) AS avg_price
FROM products;