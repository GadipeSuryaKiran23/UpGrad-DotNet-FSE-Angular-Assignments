CREATE DATABASE ProductDb;

USE ProductDb;


-----creating product table

CREATE TABLE products
( product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  product_year INT,
  list_price DECIMAL(10,2),
  category_id INT
  );

----inserting items into table
INSERT INTO products VALUES
(101, 'Royal Enfield', 2017,200000,1),
(102, 'GT', 2023, 340000,2),
(103, 'TVS', 2019, 100000, 3),
(104, 'Hero Honda', 2005, 80000, 4),
(105, 'NS220', 2022, 230000, 5);

INSERT INTO products VALUES
(106,'Classic 350',2018,180000,1),
(107,'Meteor 350',2021,210000,1),
(108,'Apache RTR',2020,120000,3),
(109,'Splendor',2010,75000,4);

----view items
SELECT *FROM products;


SELECT  product_name + ' (' + CAST(product_year AS VARCHAR) + ')' AS product_details,  list_price, ----concatenates product_name and product_year
ROUND(list_price -                         ----list_price - avg(list_price) product price is compared to the average price in its category.
(SELECT AVG(list_price)          ----subquery calculates AVG
 FROM products p2                   
 WHERE p2.category_id = p1.category_id
 ),2)AS price_difference

FROM products p1
WHERE list_price >               ---------returns only products priced above their category average.
(SELECT AVG(list_price)           -------list_price > (subquery)
 FROM products p2
 WHERE p2.category_id = p1.category_id
);