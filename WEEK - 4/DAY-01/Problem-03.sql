CREATE DATABASE CursorBasedDB;

USE CursorBasedDB;

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    order_date DATE,
    shipped_date DATE,
    order_status INT
)

INSERT INTO orders VALUES
(1,'01-03-2026',NULL,1),
(2,'02-03-2026','05-03-2026',3),
(3,'03-03-2026',NULL,2)

SELECT * FROM orders;


------after update trigger
CREATE TRIGGER trg_ValidateOrderCompletion
ON orders
AFTER UPDATE
AS
BEGIN
    BEGIN TRY

        -- Check if status is updated to Completed but shipped_date is NULL
        IF EXISTS
        (
            SELECT 1
            FROM inserted
            WHERE order_status = 4 
            AND shipped_date IS NULL
        )
        BEGIN
            RAISERROR('Order cannot be marked Completed without shipped date',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

    END TRY

    BEGIN CATCH
        PRINT 'Error during order status validation'
        PRINT ERROR_MESSAGE()
        ROLLBACK TRANSACTION
    END CATCH
END


----update table
UPDATE orders
SET order_status = 4
WHERE order_id = 1