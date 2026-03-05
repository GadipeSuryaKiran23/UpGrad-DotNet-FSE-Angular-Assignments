CREATE DATABASE StoreDb;

USE StoreDb;

---customers table
CREATE TABLE Customers
( customer_id INT PRIMARY KEY Not Null,
  customer_firstname varchar(50),
  customer_lastname varchar(50),
  email varchar(50)
  );

---inserting customers_data
INSERT INTO Customers VALUES
(10, 'Surya', 'Kiran', 'surya@gmail.com'),
(20, 'Bhanu', 'Teja', 'bhanu123@gmail.com'),
(30, 'Sai', 'Nithin', 'sainithin@gmail.com');


DELETE FROM Customers
WHERE customer_id IN (1,2,3,101,102,103);

SELECT * FROM Customers;

---orders table
CREATE TABLE orders 
( order_id INT PRIMARY KEY Not Null,
  customer_id INT FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  order_date DATE,
  order_status INT
  );
  
---inserting items into order_table

INSERT INTO orders VALUES
(101, 10, '03-03-2026', 1),
(102, 20, '04-03-2026', 4),
(103, 30, '05-03-2026', 1);

SELECT * FROM orders;


---select

SELECT Customers.customer_firstname, Customers.customer_lastname, orders.order_id, orders.order_date, orders.order_status
FROM Customers ----inner join
INNER JOIN orders 
ON Customers.customer_id = orders.customer_id
WHERE orders.order_status IN (1,4) ----where condition
ORDER BY orders.order_date DESC; -----order by