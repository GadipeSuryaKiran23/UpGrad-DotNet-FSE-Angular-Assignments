CREATE DATABASE StockAutoUpdateTriggerDB;

USE StockAutoUpdateTriggerDB;

-----creating tables
------products table
CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
)

---inserting items
INSERT INTO Products VALUES
(101,'Laptop'),
(102,'Mobile'),
(103,'Tablet'),
(104,'Keyboard'),
(105,'Mouse'),
(106,'Monitor'),
(107,'Printer'),
(108,'Headphones'),
(109,'Camera'),
(110,'Smart Watch');

SELECT * FROM Products;

---stocks table
CREATE TABLE stocks
(
    product_id INT PRIMARY KEY,
    quantity INT
)

---inserting itesm
INSERT INTO stocks VALUES
(101,50),
(102,40),
(103,30),
(104,20),
(105,60),
(106,10),
(107,35),
(108,65),
(109,15),
(110,5)

SELECT * FROM stocks;

----order_items table
CREATE TABLE order_items
(
    order_id INT,
    product_id INT,
    quantity INT
)



------Create an AFTER INSERT trigger on order_items.
CREATE TRIGGER trg_UpdateStockAfterOrder
ON order_items
AFTER INSERT
AS
BEGIN
    BEGIN TRY

        -- Check if stock is sufficient
        IF EXISTS (
            SELECT 1
            FROM inserted i
            JOIN stocks s 
            ON i.product_id = s.product_id
            WHERE s.quantity < i.quantity
        )
        BEGIN
            RAISERROR('Insufficient stock available',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        -- Reduce stock
        UPDATE s
        SET s.quantity = s.quantity - i.quantity
        FROM stocks s
        JOIN inserted i
        ON s.product_id = i.product_id

    END TRY

    BEGIN CATCH
        PRINT 'Error occurred during stock update'
        PRINT ERROR_MESSAGE()
        ROLLBACK TRANSACTION
    END CATCH
END


----- Reduce the corresponding quantity in stocks table.
---INSERT INTO order_items VALUES (1,101,5)

INSERT INTO order_items VALUES (2,110,10)




