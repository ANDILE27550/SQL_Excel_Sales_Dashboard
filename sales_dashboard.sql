-- Create the database
CREATE DATABASE sales_dashboard;

-- Use the database
USE sales_dashboard;

-- Create the sales table
CREATE TABLE sales (
    order_id INT,
    order_date DATE,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

-- Insert sample sales data
INSERT INTO sales VALUES
(1, '2025-01-05', 'Laptop', 2, 12000),
(2, '2025-01-10', 'Phone', 5, 8000),
(3, '2025-02-02', 'Laptop', 1, 12000),
(4, '2025-02-15', 'Tablet', 3, 6000),
(5, '2025-03-01', 'Phone', 4, 8000),
(6, '2025-03-10', 'Laptop', 2, 12000);

-- View all sales data
SELECT * FROM sales;

-- Total sales per product
SELECT
    product,
    SUM(quantity * price) AS total_sales
FROM sales
GROUP BY product;

-- Monthly sales totals
SELECT
    MONTH(order_date) AS month,
    SUM(quantity * price) AS monthly_sales
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;

-- Best-selling products by quantity
SELECT
    product,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY product
ORDER BY total_units_sold DESC;
