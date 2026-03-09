CREATE DATABASE Ecomm_Retail12_DB;
GO
USE Ecomm_Retail_DB;




-- 2. Create All Tables (Relational Order)
CREATE TABLE categories1 (category_id INT PRIMARY KEY, category_name VARCHAR(50) NOT NULL);
CREATE TABLE brands (brand_id INT PRIMARY KEY, brand_name VARCHAR(50) NOT NULL);
CREATE TABLE stores (store_id INT PRIMARY KEY, store_name VARCHAR(100) NOT NULL, city VARCHAR(50));
CREATE TABLE customers (customer_id INT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), city VARCHAR(50));

CREATE TABLE products1 (
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(100), 
    brand_id INT, 
    category_id INT, 
    model_year INT, 
    list_price DECIMAL(10, 2),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    store_id INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    order_status INT, -- 1: Pending, 3: Rejected, 4: Completed
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE order_items1 (
    order_id INT, item_id INT, product_id INT, quantity INT, list_price DECIMAL(10,2), discount DECIMAL(4,2),
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE archived_orders1 (
    order_id INT PRIMARY KEY, store_id INT, order_date DATE, shipped_date DATE, required_date DATE, order_status INT
);
GO -- End of Table Creation Batch

-- 3. Level-1 Problem 2: Creating the View (Requirement)
-- This MUST be in its own batch using GO [cite: 31]
GO 
CREATE VIEW vw_ProductReporting AS
SELECT p.product_name, b.brand_name, c.category_name, p.model_year, p.list_price
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
JOIN categories1 c ON p.category_id = c.category_id;
GO

-- 4. Data Maintenance Queries (Problem 4)
-- Requirement 4 & 5: Processing delay and status classification [cite: 30, 31, 32]
SELECT 
    order_id,
    DATEDIFF(day, order_date, shipped_date) AS ProcessingDelayDays,
    CASE 
        WHEN shipped_date <= required_date THEN 'On Time'
        ELSE 'Delayed'
    END AS ShippingStatus
FROM orders1 
WHERE shipped_date IS NOT NULL;
GO