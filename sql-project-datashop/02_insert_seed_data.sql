/*
====================================================
02_insert_data.sql
Project: DataShop
Description: Insert fictional transactional data to simulate
realistic e-commerce activity for analytical purpose.

The dataset includes:
- Multiple customers from different states
- Products across different categories
- Orders distributed across months
====================================================
*/

-- -------------------------------------------------
-- Insert sample date into the customers table
-- -------------------------------------------------
INSERT INTO customers (full_name, email, state, registration_date) VALUES
	('Customer_1', 'customer1@email.com', 'SP', '2023-01-10'),
    ('Customer_2', 'customer2@email.com', 'RJ', '2023-02-05'),
    ('Customer_3', 'customer3@email.com', 'MG', '2023-02-20'),
    ('Customer_4', 'customer4@email.com', 'PR', '2023-03-12'),
    ('Customer_5', 'customer5@email.com', 'RS', '2023-04-01');
    
-- -------------------------------------------------
-- Insert sample date into the products table
-- -------------------------------------------------
INSERT INTO products (product_name, category, price) VALUES
	('Product_1', 'Electronics', 7500.00),
    ('Product_2', 'Electronics', 4200.00),
    ('Product_3', 'Accessories', 150.00),
    ('Product_4', 'Accessories', 480.00),
    ('Product_5', 'Furniture', 1200.00),
    ('Product_6', 'Electronics', 1800.00);

-- -------------------------------------------------
-- Insert sample date into the orders table
-- -------------------------------------------------
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
	(1, '2023-03-01', 7650.00),
    (1, '2023-04-15', 480.00),
    (2, '2023-03-20', 4200.00),
    (3, '2023-05-02', 1950.00),
    (4, '2023-06-10', 1200.00);

-- -------------------------------------------------
-- Insert sample date into the order_items table
-- -------------------------------------------------
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
	(1, 1, 1, 7500.00),
    (1, 3, 1, 150.00),
    (2, 4, 1, 480.00),
    (3, 2, 1, 4200.00),
    (4, 6, 1, 1800.00),
    (4, 3, 1, 150.00),
    (5, 5, 1, 1200.00);