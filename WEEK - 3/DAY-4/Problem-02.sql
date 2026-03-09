CREATE DATABASE CustomersDb;

USE CustomersDb;

-- 1. Create Tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 2. Insert Sample Data
INSERT INTO customers VALUES (1, 'Ravi', 'Kumar'), (2, 'Sita', 'Sharma'), (3, 'Arjun', 'Singh'), (4, 'Meena', 'Iyer');

INSERT INTO orders VALUES (101, 1), (102, 1), (103, 2), (104, 3);

-- Data designed to hit different CASE categories:

INSERT INTO order_items VALUES 
(1, 101, 2, 5000, 0.10), (2, 102, 1, 3000, 0), -- Ravi
(3, 103, 1, 7500, 0),                         -- Sita
(4, 104, 1, 2000, 0);                         -- Arjun


-- Part A: Customers with orders (Classified using CASE)
SELECT 
    c.first_name + ' ' + c.last_name AS full_name, -- String concatenation
    'Active' AS activity_status,
    CASE 
        WHEN t.total_value > 10000 THEN 'Premium'
        WHEN t.total_value BETWEEN 5000 AND 10000 THEN 'Regular'
        ELSE 'Basic'
    END AS customer_class,
    t.total_value
FROM customers c
INNER JOIN (
    -- Nested query to calculate total order value per customer
    SELECT o.customer_id, SUM(oi.list_price * oi.quantity * (1 - oi.discount)) AS total_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id
) t ON c.customer_id = t.customer_id

UNION -- Combining results using set operator

-- Part B: Customers without orders (Handling NULL cases)
SELECT 
    c.first_name + ' ' + c.last_name AS full_name,
    'Inactive' AS activity_status,
    'None' AS customer_class,
    0 AS total_value
FROM customers c
WHERE c.customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);