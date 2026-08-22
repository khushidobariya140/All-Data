-- DROP DATABASE 
DROP DATABASE DEMO;

-- CREATE DATABASE
CREATE DATABASE DEMO;

-- USE DATABASE
USE DEMO;

-- ===== E-COMMERCE ORDER MANAGEMENT SYSTEM

-- -------------------------
-- 1. Categories
-- -------------------------
CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- -------------------------
-- 2. Products
-- -------------------------
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  category_id INT,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  added_date DATE DEFAULT (CURRENT_DATE),
  CONSTRAINT fk_products_category FOREIGN KEY (category_id)
    REFERENCES categories(category_id) ON DELETE SET NULL
);

-- -------------------------
-- 3. Customers
-- -------------------------
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  email VARCHAR(255),
  phone_number VARCHAR(30),
  address TEXT,
  registration_date DATE DEFAULT (CURRENT_DATE)
);

-- -------------------------
-- 4. Orders
-- -------------------------
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  total_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  status ENUM('Pending','Shipped','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id) ON DELETE SET NULL
);

-- -------------------------
-- 5. Order_Items
-- -------------------------
CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  subtotal DECIMAL(12,2) NOT NULL,
  CONSTRAINT fk_oi_order FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
  CONSTRAINT fk_oi_product FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE RESTRICT
);

-- -------------------------
-- 6. Payments
-- -------------------------
CREATE TABLE payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('Credit Card','PayPal','UPI','NetBanking','COD') DEFAULT 'UPI',
  payment_status ENUM('Paid','Pending','Failed') DEFAULT 'Pending',
  amount DECIMAL(12,2) NOT NULL,
  CONSTRAINT fk_pay_order FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

-- -------------------------
-- 7. Shipping
-- -------------------------
CREATE TABLE shipping (
  shipping_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  shipping_date DATETIME,
  delivery_date DATETIME,
  shipping_status ENUM('Dispatched','In Transit','Delivered') DEFAULT 'Dispatched',
  tracking_number VARCHAR(200),
  CONSTRAINT fk_ship_order FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);


-- =======================
-- Sample data (small)
-- =======================
INSERT INTO categories (category_name) VALUES ('Electronics'),('Books'),('Clothing');

INSERT INTO products (name, category_id, price, stock_quantity)
VALUES
('Wireless Earbuds', 1, 1999.00, 150),
('USB-C Cable', 1, 199.00, 500),
('Database Design Book', 2, 799.00, 50),
('T-Shirt', 3, 399.00, 200);

INSERT INTO customers (name, email, phone_number, address, registration_date)
VALUES
('Aman Singh','aman@example.com','+919812345678','Street 1, City','2022-03-15'),
('Neha Patel','neha@example.com','+919876543210','Street 2, City','2023-07-02'),
('Raj Kumar',NULL,'+919812300000','Street 3, City','2021-12-01');

-- Place an order (orders + order_items + payments + shipping)
INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES (1, '2024-09-10 10:30:00', 2198.00, 'Pending');

SET @oid = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, subtotal)
VALUES (@oid, 1, 1, 1999.00), (@oid, 2, 1, 199.00);

INSERT INTO payments (order_id, payment_date, payment_method, payment_status, amount)
VALUES (@oid, '2024-09-10 10:35:00', 'UPI', 'Paid', 2198.00);

INSERT INTO shipping (order_id, shipping_date, tracking_number, shipping_status)
VALUES (@oid, '2024-09-11 09:00:00', 'TRK123456', 'Dispatched');

-- Another order
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES (2, '2024-10-01 14:00:00', 799.00, 'Pending');
SET @o2 = LAST_INSERT_ID();

INSERT INTO order_items (order_id, product_id, quantity, subtotal) VALUES (@o2, 3, 1, 799.00);

INSERT INTO payments (order_id, amount, payment_method, payment_status) VALUES (@o2, 799.00, 'Credit Card', 'Paid');


-- =======================
-- TASKS: CRUD, Queries & Examples
-- =======================

-- 1) Implement CRUD operations (examples)
-- Insert new product
INSERT INTO products (name, category_id, price, stock_quantity) VALUES ('Power Bank', 1, 1299.00, 120);

-- Update stock when an order is placed (safe, transactional example)
-- Suppose order placed for product_id=1 qty=2: decrement stock
START TRANSACTION;

UPDATE products SET stock_quantity = stock_quantity - 2 WHERE product_id = 1 AND stock_quantity >= 2;

-- If stock decreased then create order+items...then COMMIT
COMMIT;

-- Delete orders cancelled more than 30 days ago
-- DELETE FROM orders
-- WHERE status = 'Cancelled' AND order_date < (CURRENT_DATE - INTERVAL 30 DAY);

SELECT COUNT(*) FROM orders
 WHERE status = 'Cancelled'
   AND order_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- then delete
DELETE FROM orders
 WHERE status = 'Cancelled'
   AND order_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- 2) Use SQL Clauses (WHERE, HAVING, LIMIT)
-- Find all orders placed in the last 6 months
SELECT * FROM orders WHERE order_date >= (CURRENT_DATE - INTERVAL 6 MONTH) ORDER BY order_date DESC;

-- Get the top 5 highest-priced products
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- Find customers who have placed more than 3 orders
SELECT c.customer_id, c.name, COUNT(o.order_id) AS orders_count
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING orders_count > 3;

-- 3) Apply SQL Operators (AND, OR, NOT)
-- Get all orders where status = 'Pending' AND payment has been made (Paid)
SELECT o.* FROM orders o
JOIN payments p ON p.order_id = o.order_id AND p.payment_status = 'Paid'
WHERE o.status = 'Pending';

-- Find all products that are NOT out of stock
SELECT * FROM products WHERE NOT (stock_quantity <= 0);

-- Retrieve customers who registered after 2022 OR have made purchases above 10000
SELECT DISTINCT c.*
FROM customers c
LEFT JOIN (
  SELECT customer_id, SUM(total_amount) AS spent FROM orders GROUP BY customer_id
) t ON t.customer_id = c.customer_id
WHERE c.registration_date > '2022-12-31' OR IFNULL(t.spent,0) > 10000;

-- 4) Sorting & Grouping Data (ORDER BY, GROUP BY)
-- List all products sorted by price in descending order
SELECT * FROM products ORDER BY price DESC;

-- Display the number of orders placed by each customer
SELECT c.customer_id, c.name, COUNT(o.order_id) AS orders_count
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name;

-- Show total revenue generated per category
SELECT cat.category_id, cat.category_name, SUM(o.total_amount) AS revenue
FROM categories cat
JOIN products p ON p.category_id = cat.category_id
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
GROUP BY cat.category_id, cat.category_name
ORDER BY revenue DESC;

-- 5) Aggregate Functions (SUM, AVG, MAX, MIN, COUNT)
-- Find total revenue generated by the store
SELECT SUM(total_amount) AS total_revenue FROM orders WHERE status != 'Cancelled';

-- Identify the most purchased product (by quantity)
SELECT oi.product_id, p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY oi.product_id
ORDER BY total_sold DESC
LIMIT 1;

-- Calculate average order value
SELECT AVG(total_amount) AS avg_order_value FROM orders WHERE status != 'Cancelled';

-- 6) Primary & Foreign Key Relationships
-- (Already established in CREATE TABLE; examples:)
-- Ensure orders linked to customers and products: shown via JOIN queries above.

-- 7) Implement Joins
-- Retrieve a list of products along with their category names using INNER JOIN
SELECT p.product_id, p.name AS product_name, cat.category_name
FROM products p
INNER JOIN categories cat ON p.category_id = cat.category_id;

-- Get all orders with customer details using LEFT JOIN (include orders with missing customers)
SELECT o.*, c.name AS customer_name, c.email
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;

-- Find orders that haven't been shipped using RIGHT JOIN (employing RIGHT JOIN as requested)
-- We want orders where there is no shipping record. Use shipping RIGHT JOIN orders:
SELECT o.*
FROM shipping s RIGHT JOIN orders o ON s.order_id = o.order_id
WHERE s.shipping_id IS NULL;

-- (Equivalent and common approach: LEFT JOIN shipping ON o.order_id = shipping.order_id WHERE shipping.shipping_id IS NULL)

-- Show customers who have never placed an order using FULL OUTER JOIN emulation (MySQL doesn't support FULL OUTER JOIN)
-- Emulate with UNION of LEFT and RIGHT anti-joins
-- Customers without orders:
SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL
UNION
-- (Right side is redundant here since customers table covers all; kept for pattern completeness)
SELECT c.customer_id, c.name
FROM customers c
RIGHT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL; -- likely returns none, so the LEFT JOIN result is the actual useful part.

-- 8) Use Subqueries
-- Find orders placed by customers who registered after 2022
SELECT * FROM orders
WHERE customer_id IN (SELECT customer_id FROM customers WHERE registration_date > '2022-12-31');

-- Identify the customer who has spent the most (using subquery)
SELECT c.customer_id, c.name, spent
FROM customers c
JOIN (
  SELECT customer_id, SUM(total_amount) AS spent
  FROM orders
  GROUP BY customer_id
) s ON s.customer_id = c.customer_id
ORDER BY s.spent DESC
LIMIT 1;

-- Get products that have never been ordered
SELECT p.* FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.product_id
WHERE oi.order_item_id IS NULL;

-- or using NOT IN:
-- SELECT * FROM products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_items);

-- 9) Implement Date & Time Functions
-- Extract the month from order_date to count orders per month
SELECT YEAR(order_date) AS yr, MONTH(order_date) AS mth, COUNT(*) AS orders_count
FROM orders
GROUP BY yr, mth
ORDER BY yr, mth;

-- Calculate delivery time (difference between shipping_date and delivery_date) in days
SELECT shipping_id, order_id,
  TIMESTAMPDIFF(DAY, shipping_date, delivery_date) AS delivery_days
FROM shipping
WHERE shipping_date IS NOT NULL AND delivery_date IS NOT NULL;

-- Format order_date as DD-MM-YYYY
SELECT order_id, DATE_FORMAT(order_date, '%d-%m-%Y') AS order_date_formatted FROM orders;

-- 10) Use String Manipulation Functions
-- Convert all product names to uppercase for display
SELECT product_id, UPPER(name) AS name_upper FROM products;

-- Trim whitespace from customer names
SELECT customer_id, TRIM(name) AS name_trimmed FROM customers;

-- Replace missing email values with "Not Provided"
SELECT customer_id, COALESCE(email, 'Not Provided') AS email_or_default FROM customers;

-- 11) Implement Window Functions (MySQL 8+)
-- Rank customers based on total spending
WITH customer_spent AS (
  SELECT customer_id, COALESCE(SUM(total_amount),0) AS total_spent
  FROM orders
  GROUP BY customer_id
)
SELECT customer_id, total_spent,
  RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM customer_spent;

-- Show cumulative total revenue per month (month-level aggregation then cumulative sum)
WITH monthly AS (
  SELECT DATE_FORMAT(order_date,'%Y-%m-01') AS month_start, SUM(total_amount) AS month_revenue
  FROM orders
  GROUP BY month_start
)
SELECT month_start, month_revenue,
  SUM(month_revenue) OVER (ORDER BY month_start ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_revenue
FROM monthly
ORDER BY month_start;

-- Display running total of orders placed (by date)
SELECT order_date,
  total_amount,
  SUM(total_amount) OVER (ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM orders
ORDER BY order_date;

-- 12) Apply SQL CASE Expressions
-- Assign loyalty status to customers based on total spent
WITH total_spent AS (
  SELECT customer_id, COALESCE(SUM(total_amount),0) AS spent
  FROM orders
  GROUP BY customer_id
)
SELECT c.customer_id, c.name, ts.spent,
  CASE
    WHEN ts.spent > 50000 THEN 'Gold'
    WHEN ts.spent BETWEEN 20000 AND 50000 THEN 'Silver'
    ELSE 'Bronze'
  END AS loyalty_status
FROM customers c
LEFT JOIN total_spent ts ON ts.customer_id = c.customer_id;

-- Categorize products by number sold ('Best Seller' if sold > 500)
WITH sold AS (
  SELECT p.product_id, p.name, COALESCE(SUM(oi.quantity),0) AS total_sold
  FROM products p
  LEFT JOIN order_items oi ON oi.product_id = p.product_id
  GROUP BY p.product_id
)
SELECT product_id, name, total_sold,
  CASE
    WHEN total_sold > 500 THEN 'Best Seller'
    WHEN total_sold BETWEEN 200 AND 500 THEN 'Popular'
    ELSE 'Regular'
  END AS product_category
FROM sold;




