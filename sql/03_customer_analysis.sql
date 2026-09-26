-- Olist E-Commerce Analytics
-- 03 - Customer Analysis


-- 1. Repeat customers

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS order_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY order_count DESC;


-- 2. Customer type summary

SELECT
    customer_type,
    COUNT(*) AS customers
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count,
        CASE
            WHEN COUNT(DISTINCT o.order_id) > 1
            THEN 'Repeat'
            ELSE 'One-time'
        END AS customer_type
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
GROUP BY customer_type;