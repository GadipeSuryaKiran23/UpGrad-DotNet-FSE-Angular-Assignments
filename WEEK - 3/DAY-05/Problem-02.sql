CREATE DATABASE Ecomm123Db;


USE Ecomm123Db;


CREATE TABLE categories
(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE brands
(
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100)
);


CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2),

    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);



CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100)
);


CREATE TABLE stores
(
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(100)
);


CREATE TABLE staffs
(
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    store_id INT,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);



CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    store_id INT,
    staff_id INT,
    order_date DATE,

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (staff_id) REFERENCES staffs(staff_id)
);


INSERT INTO categories VALUES
 (1,'Cars'),
 (2,'Bikes'),
 (3,'Scooters'),
 (4,'Trucks'),
 (5,'Accessories');

 INSERT INTO brands VALUES 
 (1,'Toyota'),
 (2,'Honda'),
 (3,'Yamaha'),
 (4,'BMW'),
 (5,'Suzuki');



 INSERT INTO products VALUES
(1,'Toyota Camry',1,1,2023,35000),
(2,'Honda Civic',2,1,2022,30000),
(3,'Yamaha R15',3,2,2023,15000),
(4,'BMW X5',4,1,2024,60000),
(5,'Suzuki Access',5,3,2021,9000);


INSERT INTO customers VALUES
(1,'Rahul','rahul@gmail.com','Hyderabad'),
(2,'Priya','priya@gmail.com','Chennai'),
(3,'Amit','amit@gmail.com','Hyderabad'),
(4,'Sneha','sneha@gmail.com','Bangalore'),
(5,'Kiran','kiran@gmail.com','Delhi');



INSERT INTO stores VALUES
(1,'Hyderabad Store','Hyderabad'),
(2,'Chennai Store','Chennai'),
(3,'Bangalore Store','Bangalore'),
(4,'Mumbai Store','Mumbai'),
(5,'Delhi Store','Delhi');


INSERT INTO staffs VALUES
(1,'Amit',1),
(2,'Kavya',2),
(3,'Rohit',3),
(4,'Neha',4),
(5,'Arjun',5);


INSERT INTO orders VALUES
(1,1,1,1,'2025-08-01'),
(2,2,2,2,'2025-08-02'),
(3,3,3,3,'2025-08-03'),
(4,4,4,4,'2025-08-04'),
(5,5,5,5,'2025-08-05');


------Create View for Product Details
CREATE VIEW vw_ProductDetails
AS
SELECT 
    p.product_name,
    b.brand_name,
    c.category_name,
    p.model_year,
    p.list_price
FROM products p
JOIN brands b 
ON p.brand_id = b.brand_id
JOIN categories c 
ON p.category_id = c.category_id;


----select and seeing the items
SELECT * FROM vw_ProductDetails;


-----Create View for Order Summary
CREATE VIEW vw_OrderSummary
AS
SELECT 
    o.order_id,
    c.customer_name,
    s.store_name,
    st.staff_name,
    o.order_date
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id
JOIN stores s 
ON o.store_id = s.store_id
JOIN staffs st 
ON o.staff_id = st.staff_id;


-----test the order view 
SELECT * FROM vw_OrderSummary;


-----Create Indexes for Performance
------product brand index
CREATE NONCLUSTERED INDEX idx_products_brand
ON products(brand_id);

----Product Category Index
CREATE NONCLUSTERED INDEX idx_products_category
ON products(category_id);

-----Orders Customer Index
CREATE NONCLUSTERED INDEX idx_orders1_customer
ON orders(customer_id);

----orders store index
CREATE NONCLUSTERED INDEX idx_orders_store
ON orders(store_id);

---orders staff index
CREATE NONCLUSTERED INDEX idx_orders_staff
ON orders(staff_id);

---Query Products with Brand & Category
SELECT * FROM vw_ProductDetails;

----Query Orders with Customer and Store
SELECT * FROM vw_OrderSummary;

-----Check Indexes
EXEC sp_helpindex 'products';