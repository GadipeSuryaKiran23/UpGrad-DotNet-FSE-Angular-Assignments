CREATE DATABASE Ecomm22Db;


USE Ecomm22Db;

----creating categories table
CREATE TABLE Categories
(
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100)
);

CREATE TABLE Brands -------creating brands table
(
    Brand_ID INT PRIMARY KEY,
    Brand_Name VARCHAR(100)
);


CREATE TABLE Products
(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Brand_ID INT,
    Category_ID INT,
    Price DECIMAL(10,2),

    FOREIGN KEY (Brand_ID) REFERENCES Brands(Brand_ID),
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);


CREATE TABLE Customers
(
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    City VARCHAR(100),
    Email VARCHAR(100)
);


CREATE TABLE Stores
(
    Store_ID INT PRIMARY KEY,
    Store_Name VARCHAR(100),
    City VARCHAR(100)
);


INSERT INTO Categories VALUES (1,'Cars');
INSERT INTO Categories VALUES (2,'Bikes');
INSERT INTO Categories VALUES (3,'Trucks');
INSERT INTO Categories VALUES (4,'Scooters');
INSERT INTO Categories VALUES (5,'Accessories');


INSERT INTO Brands VALUES (1,'Toyota');
INSERT INTO Brands VALUES (2,'Honda');
INSERT INTO Brands VALUES (3,'Yamaha');
INSERT INTO Brands VALUES (4,'BMW');
INSERT INTO Brands VALUES (5,'Suzuki');


INSERT INTO Products VALUES (1,'Toyota Camry',1,1,35000);
INSERT INTO Products VALUES (2,'Honda Civic',2,1,30000);
INSERT INTO Products VALUES (3,'Yamaha R15',3,2,15000);
INSERT INTO Products VALUES (4,'BMW X5',4,1,60000);
INSERT INTO Products VALUES (5,'Suzuki Access',5,4,9000);


INSERT INTO Customers VALUES 
 (1,'Rahul','Hyderabad','rahul@gmail.com'),
 (2,'Priya','Chennai','priya@gmail.com'),
 (3,'Amit','Hyderabad','amit@gmail.com'),
 (4,'Sneha','Bangalore','sneha@gmail.com'),
 (5,'Kiran','Delhi','kiran@gmail.com');



 INSERT INTO Stores VALUES 
 (1,'AutoHub Hyderabad','Hyderabad'),
 (2,'AutoHub Chennai','Chennai'),
 (3,'AutoHub Bangalore','Bangalore'),
 (4,'AutoHub Mumbai','Mumbai'),
 (5,'AutoHub Delhi','Delhi');


 SELECT 
    p.Product_Name,
    b.Brand_Name,
    c.Category_Name,
    p.Price
FROM Products p
JOIN Brands b 
ON p.Brand_ID = b.Brand_ID
JOIN Categories c 
ON p.Category_ID = c.Category_ID;



SELECT *
FROM Customers
WHERE City = 'Hyderabad';


SELECT 
    c.Category_Name,
    COUNT(p.Product_ID) AS TotalProducts
FROM Categories c
LEFT JOIN Products p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_Name;



