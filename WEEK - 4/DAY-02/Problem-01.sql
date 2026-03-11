CREATE DATABASE AutoRetailDb;

USE AutoRetailDb;

---creating products table
CREATE TABLE Products
(ProductID INT PRIMARY KEY,
 ProductName VARCHAR(100),
 StockQuantity INT CHECK (StockQuantity >= 0),
 Price DECIMAL(10,2)
);

---inserting items into products table
INSERT INTO Products VALUES
(1,'Car Tyre',50,5000),
(2,'Engine Oil',100,800),
(3,'Brake Pads',40,2500),
(4,'Car Battery',30,7000);

---select 
SELECT * FROM Products;

---creating orders table
CREATE TABLE Orders
(OrderID INT PRIMARY KEY,
 OrderDate DATETIME DEFAULT GETDATE(),
 CustomerName VARCHAR(100)
);

----inserting items into table



---craeting order_items
CREATE TABLE Order_Items
(OrderItemID INT IDENTITY PRIMARY KEY,
 OrderID INT,
 ProductID INT,
 Quantity INT,
 CONSTRAINT FK_Order
 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),

 CONSTRAINT FK_Product
 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

---creating trigger
CREATE TRIGGER trg_UpdateStock
ON Order_Items
AFTER INSERT
AS
BEGIN 
IF EXISTS (
        SELECT 1
        FROM Products p
        JOIN inserted i
        ON p.ProductID = i.ProductID
        WHERE p.StockQuantity < i.Quantity
    )
    BEGIN
        RAISERROR('Insufficient Stock',16,1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    UPDATE p
    SET p.StockQuantity = p.StockQuantity - i.Quantity
    FROM Products p
    JOIN inserted i
    ON p.ProductID = i.ProductID;
END


-----Transaction for Order Placement
DECLARE @OrderID INT = 107;

BEGIN TRANSACTION;

BEGIN TRY
    ----1. Insert into Orders
    INSERT INTO Orders(OrderID,CustomerName)
    VALUES(@OrderID,'Kiran');

    ----2. Insert order items
    INSERT INTO Order_Items(OrderID,ProductID,Quantity)
    VALUES
    (@OrderID,1,30),
    (@OrderID,2,10);
    ---- If trigger succeeds
    COMMIT;
    PRINT 'Order placed successfully';
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Order failed: ' + ERROR_MESSAGE();
END CATCH

-----
SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM Order_Items;