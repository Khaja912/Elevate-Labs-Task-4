

-- Select the active database (replace with your DB name if needed)
-- USE ecommerce;

-- Preview first 10 rows
SELECT * FROM ecommerce_data LIMIT 10;

-- Total revenue
SELECT SUM(total_amount) AS total_revenue
FROM ecommerce_data;

-- Average revenue per user
SELECT customer_id, AVG(total_amount) AS avg_revenue
FROM ecommerce_data
GROUP BY customer_id
ORDER BY avg_revenue DESC
LIMIT 10;

-- Top 5 selling products
SELECT product_name, SUM(quantity) AS total_sold
FROM ecommerce_data
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 5;

-- Revenue by city
SELECT city, SUM(total_amount) AS city_revenue
FROM ecommerce_data
GROUP BY city
ORDER BY city_revenue DESC;

-- Orders by payment method
SELECT payment_method, COUNT(*) AS total_orders
FROM ecommerce_data
GROUP BY payment_method
ORDER BY total_orders DESC;

-- Subquery: Orders greater than average
SELECT order_id, customer_id, total_amount
FROM ecommerce_data
WHERE total_amount > (SELECT AVG(total_amount) FROM ecommerce_data)
ORDER BY total_amount DESC;

-- Create a view for revenue per city
CREATE OR REPLACE VIEW revenue_per_city AS
SELECT city, SUM(total_amount) AS city_revenue
FROM ecommerce_data
GROUP BY city;

-- Query the view
SELECT * FROM revenue_per_city;

