CREATE DATABASE ProductStockSalesDb;

USE ProductStockSalesDb;


CREATE TABLE products
(product_id INT PRIMARY KEY,
 product_name VARCHAR(100)
);


INSERT INTO products VALUES
(1,'Mountain Bike'),
(2,'Road Bike'),
(3,'Helmet'),
(4,'Cycling Gloves');

SELECT * FROm products;


CREATE TABLE stores
(store_id INT PRIMARY KEY,
 store_name VARCHAR(100)
);


INSERT INTO stores VALUES
(1,'Hyderabad Store'),
(2,'Bangalore Store'),
(3,'Chennai Store');


SELECT * FROM stores;


CREATE TABLE stocks
(store_id INT  FOREIGN KEY (store_id) REFERENCES stores(store_id),
 product_id INT      FOREIGN KEY (product_id) REFERENCES products(product_id),
 quantity INT
);


INSERT INTO stocks VALUES
(1,1,50),
(1,2,30),
(2,1,40),
(2,3,60),
(3,4,25);


SELECT * FROM stocks;


CREATE TABLE orders
(order_id INT PRIMARY KEY,
 store_id INT  FOREIGN KEY (store_id) REFERENCES stores(store_id),
 order_status INT,
);


INSERT INTO orders VALUES
(101,1,4),
(102,2,4),
(103,1,4),
(104,3,1);

SELECT * FROM orders;



CREATE TABLE order_items
(item_id INT PRIMARY KEY,
 order_id INT  FOREIGN KEY (order_id) REFERENCES orders(order_id),
 product_id INT   FOREIGN KEY (product_id) REFERENCES products(product_id),
 quantity INT,
);


INSERT INTO order_items VALUES
(1,101,1,5),
(2,101,2,3),
(3,102,1,2),
(4,103,1,4),
(5,103,3,6);

-------view items in table
SELECT * FROM order_items;

---
SELECT p.product_name, s.store_name, st.quantity AS available_stock_quantity,
SUM(oi.quantity) AS total_quantity_sold
-- Display product_name, store_name, available stock quantity, and total quantity sold.
FROM stocks st
-- INNER JOIN with products table to get product names
INNER JOIN products p
ON st.product_id = p.product_id
-- INNER JOIN with stores table to get store names
INNER JOIN stores s
ON st.store_id = s.store_id
-- Include products even if they have not been sold
-- So we use LEFT JOIN between stocks and order_items
LEFT JOIN order_items oi
ON st.product_id = oi.product_id
-- Group results by product_name and store_name
GROUP BY 
p.product_name,
s.store_name,
st.quantity
-- Sort results by product_name
ORDER BY 
p.product_name;