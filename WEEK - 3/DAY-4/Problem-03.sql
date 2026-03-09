CREATE DATABASE AutomobileRetailDB;
GO
USE AutomobileRetailDB;

-- Parent Tables
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50)
);

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- Child Tables
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DECIMAL(10, 2),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE stocks (
    store_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    store_id INT,
    order_date DATE,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE order_items (
    order_id INT,
    item_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Step 1: Insert Categories, Brands, and Stores
INSERT INTO categories VALUES (1, 'Electric'), (2, 'Sedan');
INSERT INTO brands VALUES (1, 'Tesla'), (2, 'Toyota');
INSERT INTO stores VALUES (1, 'Hyd Central', 'Hyderabad'), (2, 'Bangalore Hub', 'Bangalore');

-- Step 2: Insert Products (Now that Brands/Categories exist)
INSERT INTO products VALUES 
(101, 'Model 3', 1, 1, 2024, 45000),
(102, 'Camry', 2, 2, 2023, 28000);

-- Step 3: Insert Stocks (Now that Stores/Products exist)
INSERT INTO stocks VALUES 
(1, 101, 10), -- Store 1 has Model 3
(1, 102, 0),  -- Store 1 is out of Camry
(2, 101, 0);  -- Store 2 is out of Model 3

-- Step 4: Insert Orders and Items
INSERT INTO orders VALUES (5001, 1, '2026-03-01'), (5002, 2, '2026-03-02');
INSERT INTO order_items VALUES (5001, 1, 102, 1, 28000, 0.05), (5002, 1, 101, 1, 45000, 0);


-- Requirement: Products sold in a store but currently at 0 stock
SELECT store_id, product_id FROM order_items oi JOIN orders o ON oi.order_id = o.order_id
INTERSECT
SELECT store_id, product_id FROM stocks WHERE quantity = 0;

SELECT 
    s.store_name,
    p.product_name,
    SUM(oi.quantity) AS total_sold,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM stores s
JOIN orders o ON s.store_id = o.store_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY s.store_name, p.product_name;

UPDATE stocks 
SET quantity = 0 
WHERE product_id IN (SELECT product_id FROM products WHERE model_year < 2024);