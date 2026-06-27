
CREATE DATABASE FoodserviceDB;

GO

-- USE your database
USE FoodserviceDB;
GO

-- ==========================
-- TABLES
-- ==========================

CREATE TABLE Customer (
    CustomerID INT IDENTITY(2001,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    PhoneNumber NVARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Restaurant (
    RestaurantID INT IDENTITY(3001,1) PRIMARY KEY,
    Name NVARCHAR(100),
    Street NVARCHAR(100),
    City NVARCHAR(50),
    ContactNumber NVARCHAR(20)
);

CREATE TABLE MenuItem (
    ItemID INT IDENTITY(4001,1) PRIMARY KEY,
    RestaurantID INT NOT NULL,
    Name NVARCHAR(100),
    Description NVARCHAR(255),
    Price DECIMAL(10,2),
    Available BIT,
    CONSTRAINT FK_MenuItem_Restaurant FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE Rider (
    RiderID INT IDENTITY(5001,1) PRIMARY KEY,
    Name NVARCHAR(100),
    ContactNumber NVARCHAR(20),
    Availability BIT
);

CREATE TABLE [Order] (
    OrderID INT IDENTITY(6001,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    RestaurantID INT NOT NULL,
    RiderID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(30),
    CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT FK_Order_Restaurant FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID),
    CONSTRAINT FK_Order_Rider FOREIGN KEY (RiderID) REFERENCES Rider(RiderID)
);

CREATE TABLE OrderItem (
    OrderID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT,
    PRIMARY KEY (OrderID, ItemID),
    CONSTRAINT FK_OrderItem_Order FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    CONSTRAINT FK_OrderItem_MenuItem FOREIGN KEY (ItemID) REFERENCES MenuItem(ItemID)
);

CREATE TABLE Payment (
    PaymentID INT IDENTITY(7001,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    Method NVARCHAR(30),
    Amount DECIMAL(10,2),
    PaymentDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(30),
    CONSTRAINT FK_Payment_Order FOREIGN KEY (OrderID) REFERENCES [Order](OrderID)
);

-- ==========================
-- SAMPLE DATA INSERTION
-- ==========================

-- Customers
INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber)
VALUES
('Ali','Raza','ali1@example.com','03001111111'),
('Sara','Khan','sara2@example.com','03002222222'),
('Hamza','Malik','hamza3@example.com','03003333333'),
('Ayesha','Sheikh','ayesha4@example.com','03004444444'),
('Bilal','Ahmed','bilal5@example.com','03005555555'),
('Fatima','Javed','fatima6@example.com','03006666666'),
('Usman','Butt','usman7@example.com','03007777777'),
('Zain','Ali','zain8@example.com','03008888888'),
('Hira','Saleem','hira9@example.com','03009999999'),
('Taha','Rafay','taha10@example.com','03110000001'),
('Rimsha','Shah','rimsha11@example.com','03110000002'),
('Fahad','Khalid','fahad12@example.com','03110000003'),
('Noor','Iqbal','noor13@example.com','03110000004'),
('Danish','Hanif','danish14@example.com','03110000005'),
('Sadaf','Zahid','sadaf15@example.com','03110000006');
Select * from Customer;
-- Restaurants
INSERT INTO Restaurant (Name, Street, City, ContactNumber)
VALUES
('Pizza Palace','Main Road','Islamabad','0511111111'),
('Burger Hub','Blue Area','Islamabad','0512222222'),
('Biryani House','Saddar','Rawalpindi','0513333333'),
('Food Street Café','G-9','Islamabad','0514444444'),
('Tikka Junction','F-10','Islamabad','0515555555'),
('Karachi Bites','F-11','Islamabad','0516666666'),
('Rolling Pizza','Gulshan Road','Karachi','0211111111'),
('BBQ Tonight','Clifton','Karachi','0212222222'),
('Shawarma King','Johar Town','Lahore','0421111111'),
('Lahore Grill','Model Town','Lahore','0422222222'),
('Pasta Point','DHA Phase 2','Karachi','0213333333'),
('Kebab Villa','Bahria Town','Rawalpindi','0517777777'),
('Noodle Express','I-8','Islamabad','0518888888'),
('Zinger Stop','G-11','Islamabad','0519999999'),
('Fry Master','G-6','Islamabad','0511212121');

-- Menu Items
INSERT INTO MenuItem (RestaurantID, Name, Description, Price, Available)
VALUES
(3001,'Pepperoni Pizza','Large pepperoni pizza',1200,1),
(3002,'Zinger Burger','Crispy zinger with fries',550,1),
(3003,'Chicken Biryani','Spicy biryani plate',250,1),
(3004,'Club Sandwich','Triple layer sandwich',450,1),
(3005,'Beef Tikka','Charcoal grilled tikka',700,1),
(3006,'Chicken Roll','Paratha roll with sauce',180,1),
(3007,'Cheese Pizza','12-inch cheese pizza',999,1),
(3008,'BBQ Platter','Mix grill platter',1800,1),
(3009,'Chicken Shawarma','Lebanese style shawarma',250,1),
(3010,'Beef Karahi','Traditional karahi',1500,1),
(3011,'Fettuccine Alfredo','Creamy pasta bowl',850,1),
(3012,'Seekh Kebab','2-piece spicy kebab',300,1),
(3013,'Chicken Chow Mein','Chinese noodles',450,1),
(3014,'Zinger Shawarma','Zinger meat with sauces',300,1),
(3015,'French Fries','Crispy fries',150,1);
Select * from MenuItem;
-- Riders
INSERT INTO Rider (Name, ContactNumber, Availability)
VALUES
('Ahmed','03450000001',1),
('Bilal','03450000002',1),
('Usman','03450000003',1),
('Hamza','03450000004',1),
('Sajid','03450000005',1),
('Jawad','03450000006',1),
('Tariq','03450000007',1),
('Ali Shan','03450000008',1),
('Noman','03450000009',1),
('Hussain','03450000010',1),
('Adeel','03450000011',1),
('Kashif','03450000012',1),
('Raza','03450000013',1),
('Daniyal','03450000014',1),
('Hammad','03450000015',1);
Select * from Rider;
-- Orders
INSERT INTO [Order] (CustomerID, RestaurantID, RiderID, Status)
VALUES
(2001,3001,5001,'Delivered'),
(2002,3002,5002,'Pending'),
(2003,3003,5003,'Preparing'),
(2004,3004,5004,'Delivered'),
(2005,3005,5005,'Pending'),
(2006,3006,5006,'Preparing'),
(2007,3007,5007,'Delivered'),
(2008,3008,5008,'Pending'),
(2009,3009,5009,'Preparing'),
(2010,3010,5010,'Delivered'),
(2011,3011,5011,'Pending'),
(2012,3012,5012,'Preparing'),
(2013,3013,5013,'Delivered'),
(2014,3014,5014,'Pending'),
(2015,3015,5015,'Delivered');
Select * from [Order];
-- Order Items
INSERT INTO OrderItem (OrderID, ItemID, Quantity)
VALUES
(6001,4001,2),(6002,4002,1),(6003,4003,3),(6004,4004,2),(6005,4005,1),
(6006,4006,2),(6007,4007,1),(6008,4008,3),(6009,4009,2),(6010,4010,1),
(6011,4011,2),(6012,4012,1),(6013,4013,2),(6014,4014,1),(6015,4015,2);
Select * from OrderItem;
-- Payments
INSERT INTO Payment (OrderID, Method, Amount, Status)
VALUES
(6001,'Cash',2400,'Paid'),
(6002,'Credit Card',550,'Pending'),
(6003,'Cash',750,'Paid'),
(6004,'Easypaisa',450,'Paid'),
(6005,'Cash',700,'Pending'),
(6006,'JazzCash',360,'Paid'),
(6007,'Credit Card',999,'Paid'),
(6008,'Cash',1800,'Pending'),
(6009,'Cash',250,'Paid'),
(6010,'Credit Card',1500,'Pending'),
(6011,'Cash',850,'Paid'),
(6012,'Credit Card',300,'Pending'),
(6013,'JazzCash',450,'Paid'),
(6014,'Cash',300,'Paid'),
(6015,'Easypaisa',150,'Pending');
Select * from Payment;
-- ==========================
-- TRIGGERS
-- ==========================

-- 1. Auto-update Rider Availability when Order Delivered
CREATE TRIGGER trg_UpdateRiderAvailability
ON [Order]
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Status)
    BEGIN
        UPDATE Rider
        SET Availability = 1
        FROM Rider r
        JOIN inserted i ON r.RiderID = i.RiderID
        WHERE i.Status = 'Delivered';
    END
END;

-- 2. Prevent Order Without OrderItems
CREATE TRIGGER trg_PreventEmptyOrder
ON [Order]
AFTER INSERT
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM OrderItem WHERE OrderID IN (SELECT OrderID FROM inserted)
    )
    BEGIN
        RAISERROR('Order must have at least 1 Order Item!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- 3. Auto-calculate Payment Amount Based on OrderItems
CREATE TRIGGER trg_AutoCalculatePayment
ON Payment
AFTER INSERT
AS
BEGIN
    DECLARE @OrderID INT;
    DECLARE @Amount DECIMAL(10,2);

    SELECT @OrderID = OrderID FROM inserted;

    SELECT @Amount = SUM(Quantity * Price)
    FROM OrderItem oi
    JOIN MenuItem mi ON oi.ItemID = mi.ItemID
    WHERE oi.OrderID = @OrderID;

    UPDATE Payment
    SET Amount = @Amount
    WHERE OrderID = @OrderID;
END;

-- 4. Log Deleted Customers
CREATE TABLE CustomerAuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    Email NVARCHAR(100),
    DeletedAt DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_LogCustomerDeletion
ON Customer
AFTER DELETE
AS
BEGIN
    INSERT INTO CustomerAuditLog (CustomerID, Email)
    SELECT CustomerID, Email
    FROM deleted;
END;

-- 5. Prevent MenuItem deletion if used in OrderItem
CREATE TRIGGER trg_PreventMenuItemDelete
ON MenuItem
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM OrderItem oi
        JOIN deleted d ON oi.ItemID = d.ItemID
    )
    BEGIN
        RAISERROR ('Cannot delete Menu Item because it is used in an Order.', 16, 1);
        RETURN;
    END

    DELETE FROM MenuItem
    WHERE ItemID IN (SELECT ItemID FROM deleted);
END;

-- ==========================
-- ROLES & PERMISSIONS
-- ==========================

-- Logins
CREATE LOGIN CustomerLogin WITH PASSWORD = 'Customer@123';
CREATE LOGIN RiderLogin    WITH PASSWORD = 'Rider@123';
CREATE LOGIN RestaurantLogin WITH PASSWORD = 'Restaurant@123';
CREATE LOGIN AdminLogin    WITH PASSWORD = 'Admin@123';
GO

-- Users
CREATE USER CustomerUser     FOR LOGIN CustomerLogin;
CREATE USER RiderUser        FOR LOGIN RiderLogin;
CREATE USER RestaurantUser   FOR LOGIN RestaurantLogin;
CREATE USER AdminUser        FOR LOGIN AdminLogin;
GO

-- Roles
CREATE ROLE Customer_Role;
CREATE ROLE Rider_Role;
CREATE ROLE Restaurant_Manager_Role;
CREATE ROLE Admin_Role;
GO

-- Permissions
GRANT SELECT ON Restaurant TO Customer_Role;
GRANT SELECT ON MenuItem   TO Customer_Role;
GRANT SELECT ON [Order]    TO Customer_Role;

GRANT SELECT ON [Order] TO Rider_Role;
GRANT UPDATE ON Rider   TO Rider_Role;

GRANT SELECT, INSERT, UPDATE ON MenuItem TO Restaurant_Manager_Role;
GRANT SELECT, UPDATE ON Restaurant         TO Restaurant_Manager_Role;

GRANT SELECT, INSERT, UPDATE, DELETE ON Customer     TO Admin_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Restaurant   TO Admin_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON MenuItem     TO Admin_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Rider        TO Admin_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON [Order]      TO Admin_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON OrderItem    TO Admin_Role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payment      TO Admin_Role;

-- Assign Users to Roles
ALTER ROLE Customer_Role ADD MEMBER CustomerUser;
ALTER ROLE Rider_Role ADD MEMBER RiderUser;
ALTER ROLE Restaurant_Manager_Role ADD MEMBER RestaurantUser;
ALTER ROLE Admin_Role ADD MEMBER AdminUser;
GO


BEGIN TRY
    BEGIN TRANSACTION;

    -- 1️⃣ Insert a new Order
    INSERT INTO [Order] (CustomerID, RestaurantID, RiderID, Status)
    VALUES (2001, 3001, 5001, 'Pending');

    -- 2️⃣ Get the newly inserted OrderID
    DECLARE @NewOrderID INT;
    SET @NewOrderID = SCOPE_IDENTITY();

    -- 3️⃣ Insert Order Items
    INSERT INTO OrderItem (OrderID, ItemID, Quantity)
    VALUES 
        (@NewOrderID, 4001, 2),
        (@NewOrderID, 4002, 1);

    -- 4️⃣ Insert Payment
    INSERT INTO Payment (OrderID, Method, Status)
    VALUES (@NewOrderID, 'Cash', 'Pending');

    -- 5️⃣ Optional: Update Payment Amount manually (if trigger is not firing)
    UPDATE Payment
    SET Amount = oi.TotalAmount
    FROM Payment p
    JOIN (
        SELECT OrderID, SUM(mi.Price * oi.Quantity) AS TotalAmount
        FROM OrderItem oi
        JOIN MenuItem mi ON oi.ItemID = mi.ItemID
        WHERE OrderID = @NewOrderID
        GROUP BY OrderID
    ) oi ON p.OrderID = oi.OrderID;

    COMMIT TRANSACTION;
    PRINT 'Order placed successfully!';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Transaction failed: ' + ERROR_MESSAGE();
END CATCH;
