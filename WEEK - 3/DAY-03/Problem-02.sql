CREATE DATABASE ProductPriceDb;

USE ProductPriceDb;

--1--brands table 
CREATE TABLE Brands
(brand_id INT PRIMARY KEY Not Null,
 brand_name VARCHAR(50)
 )

----inserting data into brands table

INSERT INTO Brands VALUES
(1, 'Vehicles'),
(2, 'Clothing'),
(3, 'Accessories');



----select

SELECT * FROM Brands



---2--categories table
CREATE TABLE categories
(category_id INT PRIMARY KEY Not Null,
 category_name VARCHAR(50)
 );


----inserting categories data
INSERT INTO categories VALUES
(1, 'Royal Enfield'),
(2, 'Gucci'),
(3, 'Watches');

----select
SELECT * FROM categories;




-----3-Products table

CREATE TABLE Productss
(product_id INT PRIMARY KEY Not Null,
 producr_name VARCHAR(100),
 brand_id INT  FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
 category_id INT  FOREIGN KEY (category_id) REFERENCES categories(category_id),
 model_year INT,
 list_price INT
 );


 ---inserting products data

 INSERT INTO Productss VALUES
 (101,'Classic 350',1,1,2022,190000),
 (102,'Hunter 350',1,1,2023,170000),
 (103,'Gucci T-Shirt',2,2,2023,800),
 (104,'Gucci Jacket',2,2,2024,1500),
 (105,'Fossil Watch',3,3,2022,600),
 (106,'Rolex Watch',3,3,2024,5000);

 ----select 
 SELECT * FROM Productss;


 ----select
 SELECT  Productss.producr_name, Brands.brand_name, categories.category_name, Productss.model_year, Productss.list_price
 FROM Productss ----main table is products 
 INNER JOIN brands ----first inner join
 ON Productss.brand_id = Brands.brand_id
 INNER JOIN categories -----second inner join
 ON Productss.category_id = categories.category_id
 WHERE Productss.list_price > 500 --where condition > 500
 ORDER BY Productss.list_price ASC; ---order by list_price lowest to highest
 -----ORDER BY Productss.list_price DESC;