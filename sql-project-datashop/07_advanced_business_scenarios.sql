/*
====================================================
07_advanced_business_scenarios.sql
Project: DataShop
Description: Advanced business analysis using window
functions and strategic modeling techniques.
====================================================
*/

-- -----------------------------------------------------
-- Customer behavior metrics
-- -----------------------------------------------------
WITH customer_metrics AS (
	SELECT
		c.customer_id,
		COUNT(o.order_id) AS total_order,
		SUM(o.total_amount) AS total_revenue,
		AVG(o.total_amount) AS avg_ticket,
		MAX(o.order_date) AS last_purchase_date,
		MIN(o.order_date) AS first_purchase_date
	FROM customers c
	JOIN orders o
		ON c.customer_id = o.customer_id
	GROUP BY c.customer_id)
SELECT * FROM customer_metrics;

------------------------------------------------------------
-- Frequency-based segmentation (Data-Driven) 
------------------------------------------------------------
WITH customer_metrics AS (
	SELECT
		customer_id,
        COUNT(order_id) AS total_orders,
        SUM(total_amount) AS total_revenue
    FROM orders
    GROUP BY customer_id),
ranked_customers AS (
	SELECT *,
		NTILE(3) OVER (ORDER BY total_orders DESC) AS frequency_group
	FROM customer_metrics)
SELECT
	CASE
		WHEN frequency_group = 1 THEN "High Frequency"
        WHEN frequency_group = 2 THEN "Mid Frequency"
        ELSE "Low Frequency"
	END AS segment,
    COUNT(customer_id) AS customers,
    SUM(total_revenue) AS revenue,
    ROUND(SUM(total_revenue) / SUM(SUM(total_revenue)) OVER() * 100, 2) AS revenue_percentage,
    AVG(total_revenue) AS avg_revenue_per_order
FROM ranked_customers
GROUP BY segment;

------------------------------------------------------------
-- Análise temporal (2023 vc 2024 por Segmento Dinâmico) 
------------------------------------------------------------
WITH customer_metrics AS (
	SELECT
		customer_id,
        COUNT(order_id) AS total_orders
	FROM orders
    GROUP BY customer_id),
ranked_customers AS (
	SELECT *,
		NTILE(3) OVER (ORDER BY total_orders DESC) AS frequency_group
	FROM customer_metrics)
SELECT
	CASE
		WHEN r.frequency_group = 1 THEN 'High Frequency'
        WHEN r.frequency_group = 2 then 'Mid Frequency'
        ELSE 'Low Frequency'
	END AS segment,
    YEAR(o.order_date) AS years,
    COUNT(o.total_amount) AS revenue
FROM orders o 
JOIN ranked_customers r
	ON o.customer_id = r.customer_id
GROUP BY segment, years
ORDER BY segment, years;

------------------------------------------------------------
-- Concentração de Receita (Pareto 80/20) 
------------------------------------------------------------
WITH customer_revenue AS (
	SELECT
		customer_id,
        SUM(total_amount) AS revenue
	FROM orders
    GROUP BY customer_id),
ranked AS (
	SELECT *,
		SUM(revenue) OVER() AS total_revenue,
        SUM(revenue) OVER(ORDER BY revenue DESC) AS cumulative_revenue,
        COUNT(*) OVER() AS total_customers
	FROM customer_revenue)
SELECT     
    COUNT(customer_id) AS customer_until_80_percent,
    ROUND(COUNT(customer_id) / MAX(total_customers) * 100, 2) AS percentage_of_customers
FROM ranked
WHERE cumulative_revenue <= total_revenue * 0.8;

------------------------------------------------------------
-- Identificação de clientes em risco (Churn Analysis)
------------------------------------------------------------
SELECT
	customer_id,
    MAX(order_date) AS last_purchase,
    DATEDIFF('2025-01-31', MAX(order_date)) AS days_since_last_purchase
FROM orders
GROUP BY customer_id
HAVING days_since_last_purchase > 120
ORDER BY days_since_last_purchase DESC;