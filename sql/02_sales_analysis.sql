-- Olist E-Commerce Analytics
-- 02 - Sales Analysis


-- 1. Total product revenue

SELECT
    SUM(oi.price) AS total_revenue
FROM order_items oi;


-- 2. Monthly revenue

SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;


-- 3. Monthly revenue and orders

SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS month,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;


-- 4. Average Order Value

SELECT
    AVG(order_value) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(price) AS order_value
    FROM order_items
    GROUP BY order_id
);


-- 5. Revenue by customer state

SELECT
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(oi.price) AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC;