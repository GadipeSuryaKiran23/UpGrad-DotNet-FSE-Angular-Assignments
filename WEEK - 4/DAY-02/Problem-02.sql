USE AutoRetailDb;


----adding order_status column to the Orders table
ALTER TABLE Orders
ADD OrderStatus INT DEFAULT 1;

----check items
SELECT * FROM Orders;

----inserting items into orders 
INSERT INTO Orders(OrderID,CustomerName,OrderStatus) VALUES
(200,'Surya',2);

----inserting items into order_items 
INSERT INTO Order_Items(OrderID,ProductID,Quantity) VALUES
(200,1,5),
(200,2,10);


-----savepoint
DECLARE @CancelOrderID INT = 200;

BEGIN TRANSACTION;

BEGIN TRY

    -----1. Savepoint before restoring stock
    SAVE TRANSACTION BeforeStockRestore;

    -----2. Restore stock quantities
    UPDATE p
    SET p.StockQuantity = p.StockQuantity + oi.Quantity
    FROM Products p
    JOIN Order_Items oi
        ON p.ProductID = oi.ProductID
    WHERE oi.OrderID = @CancelOrderID;

    ----3. Check if order exists
    IF NOT EXISTS (SELECT 1 FROM Orders WHERE OrderID = @CancelOrderID)
    BEGIN
        RAISERROR('Order does not exist',16,1);
    END

    ----4. Update order status to Rejected 
    UPDATE Orders
    SET OrderStatus = 3
    WHERE OrderID = @CancelOrderID;

    ----5. Commit transaction
    COMMIT;
    PRINT 'Order cancelled successfully and stock restored';
END TRY

BEGIN CATCH
    PRINT 'Error occurred: ' + ERROR_MESSAGE();

    -- Rollback to savepoint
    ROLLBACK TRANSACTION BeforeStockRestore;
    -- Full rollback if required
    ROLLBACK;
    PRINT 'Transaction rolled back due to error';
END CATCH;


-----View Final Items
SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM Order_Items;