-- FOR THE DROP DATABASE
DROP DATABASE PROJECT;

-- FOR THE CREATE DATABSE
CREATE DATABASE PROJECT;

-- USE OF DATABASE
USE PROJECT;

--  TABLE OF Customers
CREATE TABLE Customers (
  CustomerID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(150),
  Address VARCHAR(255)
);

--  TABLE OF Products
CREATE TABLE Products (
  ProductID INT AUTO_INCREMENT PRIMARY KEY,
  ProductName VARCHAR(150) NOT NULL,
  Price DECIMAL(10,2) NOT NULL,
  Stock INT NOT NULL DEFAULT 0
);

-- TABLE OF Orders
CREATE TABLE Orders (
  OrderID INT AUTO_INCREMENT PRIMARY KEY,
  CustomerID INT NOT NULL,
  OrderDate DATE NOT NULL,
  TotalAmount DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- TABLE OF OrderDetails
CREATE TABLE OrderDetails (
  OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  SubTotal DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- INSERT ATLEAST 5 SAMPLE RECORDS IN CUSTOMERS TABLE
INSERT INTO Customers (Name, Email, Address) VALUES
('Alice Johnson','alice@example.com','12 Rose St, CityA'),
('Bob Patel','bob.patel@example.com','78 Lake Rd, CityB'),
('Carla Mehta','carla@example.com','5 Garden Ave, CityC'),
('Dev Shah','dev.shah@example.com','101 Hill St, CityD'),
('Esha Rao','esha.rao@example.com','22 Mango Lane, CityE');

-- INSERT ATLEAST 5 RECORDS IN PRODUCTS TABLE
INSERT INTO Products (ProductName, Price, Stock) VALUES
('Wireless Mouse', 799.00, 50),
('Bluetooth Headphones', 1499.00, 30),
('USB-C Cable', 299.00, 200),
('Laptop Stand', 1299.00, 40),
('Webcam HD', 2199.00, 15),
('Portable SSD 512GB', 4999.00, 10);

-- INSERT ATLEAST 5 SAMPLE RECORDS IN ORDER TABLE
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, CURDATE() - INTERVAL 5 DAY, 2298.00),   -- Alice
(2, CURDATE() - INTERVAL 40 DAY, 1299.00),  -- Bob 
(3, CURDATE() - INTERVAL 2 DAY, 1098.00),   -- Carla
(4, CURDATE() - INTERVAL 10 DAY, 799.00),   -- Dev
(1, CURDATE() - INTERVAL 20 DAY, 1499.00);  -- Alice (another order)

-- INSERT ATLEAST 5 SAMPLE RECORDS IN OrderDetails TABLE
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 1, 799.00),    -- Order 1:wireless moouse
(1, 2, 1, 1499.00),   -- Order 1: Headphones  
(2, 4, 1, 1299.00),   -- Order 2: Laptop Stand
(3, 3, 2, 298.00),    -- Order 3: 2 x USB-C Cable 
(3, 3, 1, 299.00),    -- Another line
(4, 1, 1, 799.00),    -- Order 4: Wireless Mouse
(5, 2, 1, 1499.00);   -- Order 5: Bluetooth Headphones

-- ALL THE CUSTOMERS QUERIES
-- READ ALL RECORDS
SELECT * FROM Customers;

-- UPDATE RECORDS
UPDATE Customers
SET Address = '99 New Park Rd, CityA'
WHERE CustomerID = 1;

-- DELETE SPECIFIC RECORDS
DELETE FROM Customers WHERE CustomerID = 5;

--  SPECIFIC WHOSE NAME IS ALICE
SELECT * FROM Customers WHERE Name = 'Alice Johnson';


-- ALL THE ORDER QUERIES
-- READ ALL RECORDS
SELECT * FROM Orders;

-- RETRIVE SPECIFIC NUMBER
SELECT * FROM Orders WHERE CustomerID = 1;

-- UPDATE AN TOTAL AMOUNT
UPDATE Orders
SET TotalAmount = (SELECT IFNULL(SUM(SubTotal),0) FROM OrderDetails WHERE OrderDetails.OrderID = Orders.OrderID)
WHERE OrderID = 3;

-- DELETE ORDERID
DELETE FROM Orders WHERE OrderID = 2;

-- RETRIVE ORDER PLACED IN LAST 30 DAYS
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

-- HIGHEST,LOWEST AND AVERAGE ORDER
SELECT
  MAX(TotalAmount) AS HighestOrder,
  MIN(TotalAmount) AS LowestOrder,
  AVG(TotalAmount) AS AverageOrder
FROM Orders;



-- ALL QUERIES OF PRODUCT TABLE
-- SORTED PRICE IN DESCENDING ORDER
SELECT * FROM Products ORDER BY Price DESC;

-- UPDATE THE SPECIFIC PRICE OF PRODUCT
 UPDATE Products SET Price = 850.00 WHERE ProductID = 1;
 
-- DELETE PRODUCT IF OUT OF STOCK
DELETE FROM Products WHERE ProductID = 6 AND Stock = 0;

-- RETRIVE PRODUCTS WHOSE PRICE IS IN BETWEEN 500 & 2000
 SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

-- cheapest price
SELECT ProductName, Price FROM Products WHERE Price = (SELECT MIN(Price) FROM Products);

-- most expensive price
SELECT ProductName, Price FROM Products WHERE Price = (SELECT MAX(Price) FROM Products);

-- ALL QUERIES OF ORDERDETAILS
-- SPECIFIC ORDER
SELECT od.*, p.ProductName, p.Price
FROM OrderDetails od
LEFT JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderID = 1;

-- USE OF SUM()
SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;

-- RETRIVE TOP MOST 3 PRODUCTS
 SELECT od.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY od.ProductID
ORDER BY TotalQuantitySold DESC
LIMIT 3;

-- Using COUNT() 
SELECT COUNT(*) AS TimesAppearedInOrderDetails
FROM OrderDetails
WHERE ProductID = 1;

-- If you want total units sold (sum of quantities) use SUM():
SELECT SUM(Quantity) AS TotalUnitsSold FROM OrderDetails WHERE ProductID = 1;
























































































































































































































































































































































































































































































































































































































































































































































UM(SubTotal),0) FROM OrderDetails WHERE OrderDetails.OrderID = Orders.OrderID)
WHERE OrderID = 3;

-- DELETE RECORDS
DELETE FROM Orders WHERE OrderID = 2;

-- ORDER PLACED IN 30 DAYS
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

-- HIGHEST,LOWEST AND VERAGE ORDER
SELECT
  MAX(TotalAmount) AS HighestOrder,
  MIN(TotalAmount) AS LowestOrder,
  AVG(TotalAmount) AS AverageOrder
FROM Orders;

-- READ ALL RECORDS
SELECT * FROM Orders;

-- 
SELECT * FROM Products ORDER BY Price DESC;

-- 
UPDATE Products 
SET Price = 850.00 
WHERE ProductID = 1;

-- 
DELETE FROM Products WHERE Stock = 0;
-- or to delete a specific product only when out of stock:
DELETE FROM Products WHERE ProductID = 6 AND Stock = 0;

-- 
SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

-- 
-- cheapest price
SELECT ProductName, Price FROM Products WHERE Price = (SELECT MIN(Price) FROM Products);

-- most expensive price
SELECT ProductName, Price FROM Products WHERE Price = (SELECT MAX(Price) FROM Products);

-- READ ALL RECORDS
SELECT * FROM OrderDetails;

--
SELECT od.*, p.ProductName, p.Price
FROM OrderDetails od
LEFT JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderID = 1;

--
SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;

--
SELECT od.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY od.ProductID
ORDER BY TotalQuantitySold DESC
LIMIT 3;

-- Using COUNT() 
SELECT COUNT(*) AS TimesAppearedInOrderDetails
FROM OrderDetails
WHERE ProductID = 1;

-- If you want total units use SUM():
SELECT SUM(Quantity) AS TotalUnitsSold FROM OrderDetails WHERE ProductID = 1;

