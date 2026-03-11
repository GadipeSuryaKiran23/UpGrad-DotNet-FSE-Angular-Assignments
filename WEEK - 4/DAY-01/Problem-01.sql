CREATE DATABASE StoredProceduresDB; 

USE StoredProceduresDB;

----creating tables
----store table
CREATE TABLE Stores
(
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(50)
);

---insert items
INSERT INTO Stores VALUES
(1,'Hyderabad Store'),
(2,'Mumbai Store')

----view items
SELECT * FROM Stores;


---orders table
CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    StoreID INT,
    OrderDate DATE
);

---insert items 
INSERT INTO Orders VALUES
(1,1,'07-03-2026'),
(2,1,'08-03-2026'),
(3,2,'09-03-2026')

----view items
SELECT * FROM Orders;


-----products table
CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);
---insert items 
INSERT INTO Products VALUES
(101,'Laptop'),
(102,'Mobile'),
(103,'Tablet')

-----adding more products
INSERT INTO Products VALUES
(104,'Keyboard'),
(105,'Mouse'),
(106,'Monitor'),
(107,'Printer'),
(108,'Headphones'),
(109,'Camera'),
(110,'Smart Watch');

----view items
SELECT * FROM Products;


---order details table
CREATE TABLE Order_Details
(
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(5,2)
);
----insert items
INSERT INTO Order_Details VALUES
(1,101,2,50000,10),
(1,102,1,20000,5),
(2,103,3,15000,0),
(3,101,1,50000,15)

----adding details for new items
INSERT INTO Order_Details VALUES
(2,104,10,2000,0),
(2,105,12,1000,5),
(2,106,6,12000,8),
(3,107,4,9000,5),
(3,108,9,3000,0),
(3,109,2,25000,10),
(3,110,7,7000,5);

----view items
SELECT * FROM Order_Details;



-----Create a stored procedure to generate total sales amount per store
CREATE PROCEDURE usp_GetTotalSalesByStore
    @StoreID INT
AS
BEGIN
    SELECT 
        s.StoreID,
        s.StoreName,
        SUM(ISNULL(od.Quantity * od.UnitPrice,0)) AS TotalSales
    FROM Stores s
    JOIN Orders o 
        ON s.StoreID = o.StoreID
    JOIN Order_Details od 
        ON o.OrderID = od.OrderID
    WHERE s.StoreID = @StoreID
    GROUP BY s.StoreID, s.StoreName
END

EXEC usp_GetTotalSalesByStore 1

----- Create a stored procedure to retrieve orders by date range
CREATE PROCEDURE usp_GetOrdersByDateRange
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        OrderID,
        StoreID,
        OrderDate
    FROM Orders
    WHERE OrderDate BETWEEN @StartDate AND @EndDate
END

EXEC usp_GetOrdersByDateRange '01-03-2026','10-03-2026'

------Calculate Price After Discount
CREATE FUNCTION dbo.fn_CalculateDiscountPrice
(
    @Price DECIMAL(10,2),
    @Discount DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @FinalPrice DECIMAL(10,2)

    SET @FinalPrice = @Price - (@Price * ISNULL(@Discount,0) / 100)

    RETURN @FinalPrice
END

----using the function
SELECT dbo.fn_CalculateDiscountPrice(1000,10) AS FinalPrice


------Create a table-valued function to return top 5 selling products.
CREATE FUNCTION dbo.fn_GetTopSellingProductss()
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 5
        p.ProductID,
        p.ProductName,
        SUM(od.Quantity) AS TotalSold
    FROM Products p
    JOIN Order_Details od
        ON p.ProductID = od.ProductID
    GROUP BY p.ProductID, p.ProductName
    ORDER BY TotalSold DESC
)

----calling the function
SELECT * FROM dbo.fn_GetTopSellingProductss()
