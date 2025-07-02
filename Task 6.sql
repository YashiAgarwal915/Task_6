-- 1. Preview first 10 rows
SELECT * FROM online_sales
LIMIT 10;

-- 2. Monthly Revenue & Order Volume
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;

-- 3. Top 3 Months by Revenue
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS month_year,
    SUM(amount) AS monthly_revenue
FROM
    online_sales
GROUP BY
    month_year
ORDER BY
    monthly_revenue DESC
LIMIT 3;

-- 4. Total Revenue Overall
SELECT SUM(amount) AS total_revenue FROM online_sales;

-- 5. Distinct Orders Count
SELECT COUNT(DISTINCT order_id) AS total_orders FROM online_sales;

-- 6. Aggregate Revenue by Product (Top 5)
SELECT
    product_id,
    SUM(amount) AS total_revenue
FROM
    online_sales
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 5;

-- 7. Monthly Average Order Value
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    AVG(amount) AS avg_order_value
FROM
    online_sales
GROUP BY year, month
ORDER BY year, month;
