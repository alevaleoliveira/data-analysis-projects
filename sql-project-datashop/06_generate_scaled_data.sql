/*
====================================================
06_scaled_data.sql
Project: DataShop
Description: Database scaling and synthetic data generation
to simulate a realistic e-commerce environment.

Focus:
- Data expansion using recursive CTEs
- Simulation of 250 customers and 1,000 + orders
- Multi-year transactional data (2023-2024)
- Preparing dataset for advanced analytical scenarios
====================================================
*/

-- -------------------------------------------------
-- Generate additional customers
-- -------------------------------------------------
INSERT INTO customers (full_name, email, state, registration_date)
WITH RECURSIVE numbers AS (
    SELECT 6 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 250
)
SELECT
    CONCAT('Customer_', n),
    CONCAT('customer', n, '@email.com'),
    ELT(FLOOR(1 + RAND() * 5), 'SP', 'RJ', 'MG', 'PR', 'RS'),
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 730) DAY)
FROM numbers;

-- -------------------------------------------------
-- Generate additional products
-- -------------------------------------------------
INSERT INTO products (product_name, category, price)
WITH RECURSIVE numbers AS (
	SELECT 7 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 40
)
SELECT
	CONCAT('Product_', n),
    ELT(FLOOR(1 + RAND() * 4), 	'Electronics', 'Accessories', 'Furniture', 'Home'),
    ROUND(50 + (RAND() * 5000), 2)
FROM numbers;

-- -------------------------------------------------
-- Generate 50 orders
-- Heavy Buyers (ID 6-55)
-- -------------------------------------------------
INSERT INTO orders (customer_id, order_date, total_amount)
WITH RECURSIVE numbers AS (
	SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 600
)
SELECT
	FLOOR(6 + RAND() * 50),
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 730) DAY),
    0
FROM numbers;

-- -------------------------------------------------
-- Generate 125 orders
-- Occasional Buyers (ID 56-180)
-- -------------------------------------------------
INSERT INTO orders (customer_id, order_date, total_amount)
WITH RECURSIVE numbers AS (
	SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 325
)
SELECT
	FLOOR(56 + RAND() * 125),
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 730) DAY),
    0
FROM numbers;

-- -------------------------------------------------
-- Generate 70 orders
-- One-time Buyers (ID 181-250)
-- -------------------------------------------------
INSERT INTO orders (customer_id, order_date, total_amount)
SELECT
	customer_id,
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 730) DAY),
    0
FROM customers
WHERE customer_id BETWEEN 181 AND 250;

-- -------------------------------------------------
-- Generate order items
-- -------------------------------------------------
SET SESSION cte_max_recursion_depth = 2000;
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
SELECT
	o.order_id,
    p.product_id,
    CASE
		WHEN o.customer_id BETWEEN 6 AND 55 THEN FLOOR(2 + RAND() * 4)   -- heavy
        WHEN O.customer_id BETWEEN 56 AND 180 THEN FLOOR(1 + RAND() * 3) -- occasional
        ELSE 1                                                           -- one-time
	END AS quantity,
    p.price
FROM orders o
JOIN products p
	ON p.product_id = FLOOR(1 + RAND() * 40);

-- -------------------------------------------------
-- Update order totals
-- -------------------------------------------------
UPDATE orders o
JOIN (
	SELECT 
		order_id,
        SUM(quantity * unit_price) AS total
	FROM order_items
    GROUP BY  order_id
) calc ON o.order_id = calc.order_id
SET o.total_amount = calc.total;