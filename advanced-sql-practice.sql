/* Switch to the target database */
USE testdb;

/* Task 1: Join query to combine customers and orders */
-- Retrieve customer details and their order information
SELECT 
    c.id,
    c.first_name,
    c.last_name,
    o.id AS order_id,
    o.order_date,
    o.total_amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
ORDER BY c.id, o.order_date;

/* Task 2: GROUP BY with aggregate functions */
-- Calculate total number of orders and total amount spent per customer
SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC;

/* Task 3: GROUP BY with HAVING clause */
-- Find customers with more than 1 order and total spent greater than $100
SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.id) AS order_count,
    SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
HAVING COUNT(o.id) > 1 AND SUM(o.total_amount) > 100
ORDER BY total_spent DESC;

/* Task 4: WHERE clause to filter data */
-- List orders placed in 2023 by customers with last name 'Smith'
SELECT 
    c.first_name,
    c.last_name,
    o.id AS order_id,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
WHERE c.last_name = 'Smith' AND YEAR(o.order_date) = 2023
ORDER BY o.order_date;

/* Task 5: Subquery to filter customers based on order activity */
-- Find customers with orders exceeding the average order amount
SELECT 
    c.first_name,
    c.last_name,
    o.id AS order_id,
    o.total_amount
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
WHERE o.total_amount > (
    SELECT AVG(total_amount)
    FROM orders
)
ORDER BY o.total_amount DESC;

/* Task 6: Subquery in SELECT to count orders per customer */
-- List customers and their order count, for customers with orders in 2023
SELECT 
    c.first_name,
    c.last_name,
    (
        SELECT COUNT(id)
        FROM orders o
        WHERE o.customer_id = c.id
    ) AS order_count
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id AND YEAR(o.order_date) = 2023
)
ORDER BY order_count DESC;

/* Task 7: Combined JOIN, GROUP BY, and Subquery */
-- Identify customers with total order amounts in the top 50% of all customers
SELECT 
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
WHERE o.customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(total_amount) >= (
        SELECT AVG(total_sum)
        FROM (
            SELECT SUM(total_amount) AS total_sum
            FROM orders
            GROUP BY customer_id
        ) sub
    )
)
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC;