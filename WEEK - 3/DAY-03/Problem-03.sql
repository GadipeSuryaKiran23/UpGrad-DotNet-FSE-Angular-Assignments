CREATE DATABASE StoreSalesDb;

USE StoreSalesDb;


----creating stores table
CREATE TABLE Stores
(store_id INT PRIMARY KEY Not Null,
 store_name VARCHAR(50),
 city VARCHAR(30)
 );

-----inserting values into store table
INSERT INTO Stores VALUES
(1,'Demart', 'Karimnagar'),
(2,'Reliance Store', 'Hyderabad'),
(3,'Zudio', 'Warangal');

-----select 
SELECT * FROM Stores;



-----creating orders table
CREATE TABLE Orders
( order_id INT PRIMARY KEY,
  store_id INT, FOREIGN KEY (store_id) REFERENCES stores(store_id),
  order_date DATE,
  order_status INT
);

-----inserting values into table
INSERT INTO Orders VALUES
(101, 1, '03-03-2026', 4),
(102, 2, '04-03-2026', 1),
(103, 1, '02-03-2026', 4),
(104, 3, '01-03-2026', 1),
(105, 2, '04-03-2026', 4);

SELECT * FROM Orders;



----creating order_items table
CREATE TABLE order_items
( item_id INT PRIMARY KEY,
  order_id INT  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  quantity INT,
  list_price INT,
  discount DECIMAL(4,2)
);

----INSERTING VALUES INTO TABLE
INSERT INTO order_items VALUES
(1,101,2,500,0.10),
(2,101,1,800,0.05),
(3,102,3,400,0.00),
(4,103,2,1000,0.15),
(5,104,1,2000,0.20),
(6,104,2,600,0.05),
(7,105,1,900,0.10);

----select
SELECT * FROM order_items;



SELECT s.store_name,-----select store names

SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales -----calculated column inside an aggregate function

FROM stores s
INNER JOIN orders o     ----first join
ON s.store_id = o.store_id

INNER JOIN order_items oi ------second inner join
ON o.order_id = oi.order_id

WHERE o.order_status = 4     -----where

GROUP BY s.store_name      ----group by

ORDER BY total_sales DESC;  ----order by, total sales in  decending order