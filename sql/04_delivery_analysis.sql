-- Olist E-Commerce Analytics
-- 04 - Delivery & Customer Experience Analysis


-- 1. Average delivery time

SELECT
    AVG(
        julianday(order_delivered_customer_date)
        - julianday(order_purchase_timestamp)
    ) AS average_delivery_days
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;


-- 2. Late delivery rate

SELECT
    AVG(
        CASE
            WHEN order_delivered_customer_date > order_estimated_delivery_date
            THEN 1.0
            ELSE 0.0
        END
    ) * 100 AS late_delivery_rate
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;


-- 3. Late delivery vs review score

SELECT
    CASE
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
        THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,
    COUNT(*) AS orders,
    AVG(r.review_score) AS average_review_score
FROM orders o
JOIN reviews r
    ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
GROUP BY delivery_status;


-- 4. Delivery status, order percentage and review score

SELECT
    CASE
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
        THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,
    COUNT(*) AS orders,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS order_percentage,
    ROUND(AVG(r.review_score), 2) AS average_review_score
FROM orders o
JOIN reviews r
    ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
GROUP BY delivery_status;