/*
====================================================
05_advanced_queries.sql
Project: DataShop
Description: Advanced business analysis using window fuctions,
raking, growth caculations and revenue contribution.

Focus:
- Revenue ranking
- Percentage contribution
- Monthly growth analysis
- Running totals
- Advanced performance metrics
====================================================
*/

-- -------------------------------------------------
-- Product revenue ranking
-- -------------------------------------------------
SELECT
	p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    ROUND(
		(SUM(oi.quantity * oi.unit_price) / 
         SUM(SUM(oi.quantity * oi.unit_price)) OVER ()) * 100, 2) AS revenue_percentage,
    RANK() OVER(ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS revenue_rank
FROM products p
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- -------------------------------------------------
-- Revenue share by category (%)
-- -------------------------------------------------
SELECT
	category,
    total_revenue,
    ROUND((total_revenue / SUM(total_revenue) OVER()) * 100, 2) AS revenue_percentage
FROM(
	SELECT
		p.category,
		SUM(oi.quantity * oi.unit_price) AS total_revenue
	FROM products p
	JOIN order_items oi
		ON p.product_id = oi.product_id
	GROUP BY p.category
) AS category_revenue;

-- -------------------------------------------------
-- Monthly revenue with growth rate
-- -------------------------------------------------
SELECT
	year_months,
    monthly_revenue,
	ROUND(
		(monthly_revenue / SUM(monthly_revenue) OVER ()) * 100, 2) AS month_revenue_percentage,
    LAG(monthly_revenue) OVER(ORDER BY year_months) AS previous_month_revenue,
	ROUND (
		((monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY year_months))
        / LAG(monthly_revenue) OVER (ORDER BY year_months)
	) * 100, 2) AS growth_percentage
FROM(
	SELECT
		DATE_FORMAT(order_date, '%Y-%m') AS year_months,
		SUM(total_amount) as monthly_revenue
	FROM orders
	GROUP BY year_months
) AS monthly_data;

-- -------------------------------------------------
-- Running total revenue over time
-- -------------------------------------------------
SELECT
	year_months,
    monthly_revenue,
    SUM(monthly_revenue) OVER (ORDER BY year_months) AS cumulative_revenue
FROM (
	SELECT
		DATE_FORMAT(order_date, '%Y-%m') AS year_months,
		SUM(total_amount) AS monthly_revenue
	FROM orders
	GROUP BY year_months
) AS monthly_data;

-- -------------------------------------------------
-- Monthly average order value
-- -------------------------------------------------
SELECT
	DATE_FORMAT(order_date, '%Y-%m') AS year_months,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS avg_ticket    
FROM orders
GROUP BY year_months
ORDER BY year_months;

-- -------------------------------------------------
-- Revenue contribution by client (%)
-- -------------------------------------------------
SELECT
	full_name,
    total_spent,
    ROUND((total_spent / SUM(total_spent) OVER ()) *100, 2) AS revenue_percentage
FROM (
	SELECT
		c.full_name,
		SUM(o.total_amount) AS total_spent
	FROM customers c
	JOIN orders o
		ON c.customer_id = o.customer_id
	GROUP BY c.full_name
) AS customer_revenue
ORDER BY total_spent DESC;