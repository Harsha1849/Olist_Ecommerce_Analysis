-- Olist E-Commerce Analytics
-- 01 - Order Analysis


-- 1. Orders by status

SELECT
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;


-- 2. Total orders

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;


-- 3. Orders by customer state

SELECT
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS order_count
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY order_count DESC;


-- 4. Delivered orders by state

SELECT
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS delivered_orders
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY delivered_orders DESC;