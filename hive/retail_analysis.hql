-- =========================================================
-- RETAIL SALES PERFORMANCE ANALYSIS
-- Hive Analysis Queries
-- Table: retailsales
-- =========================================================


-- 1. Display all records
SELECT * FROM retailsales;


-- 2. Total number of sales records
SELECT COUNT(*) AS total_records
FROM retailsales;


-- 3. Total revenue
SELECT SUM(Total_Sales) AS total_revenue
FROM retailsales;


-- 4. Total quantity sold
SELECT SUM(Quantity) AS total_quantity_sold
FROM retailsales;


-- 5. Top-selling products based on quantity
SELECT Product,
       SUM(Quantity) AS total_quantity
FROM retailsales
GROUP BY Product
ORDER BY total_quantity DESC;


-- 6. Product-wise total revenue
SELECT Product,
       SUM(Total_Sales) AS total_revenue
FROM retailsales
GROUP BY Product
ORDER BY total_revenue DESC;


-- 7. Category-wise sales performance
SELECT Category,
       SUM(Quantity) AS total_quantity,
       SUM(Total_Sales) AS total_revenue
FROM retailsales
GROUP BY Category
ORDER BY total_revenue DESC;


-- 8. Region-wise sales performance
SELECT Region,
       SUM(Quantity) AS total_quantity,
       SUM(Total_Sales) AS total_revenue
FROM retailsales
GROUP BY Region
ORDER BY total_revenue DESC;


-- 9. Monthly revenue trend
SELECT SUBSTR(Date, 1, 7) AS month,
       SUM(Total_Sales) AS monthly_revenue
FROM retailsales
GROUP BY SUBSTR(Date, 1, 7)
ORDER BY month;


-- 10. Monthly quantity sold
SELECT SUBSTR(Date, 1, 7) AS month,
       SUM(Quantity) AS monthly_quantity
FROM retailsales
GROUP BY SUBSTR(Date, 1, 7)
ORDER BY month;


-- 11. Category-wise average unit price
SELECT Category,
       AVG(Unit_Price) AS average_unit_price
FROM retailsales
GROUP BY Category
ORDER BY average_unit_price DESC;


-- 12. Product-wise average inventory
SELECT Product,
       AVG(Inventory) AS average_inventory
FROM retailsales
GROUP BY Product
ORDER BY average_inventory ASC;


-- 13. Low inventory products
SELECT Product,
       Inventory
FROM retailsales
WHERE Inventory < 30
ORDER BY Inventory ASC;


-- 14. High-value sales transactions
SELECT sales_ID,
       Product,
       Region,
       Total_Sales
FROM retailsales
WHERE Total_Sales > 100000
ORDER BY Total_Sales DESC;


-- 15. Region and category-wise revenue
SELECT Region,
       Category,
       SUM(Total_Sales) AS total_revenue
FROM retailsales
GROUP BY Region, Category
ORDER BY total_revenue DESC;


-- 16. Product-wise total sales and quantity
SELECT Product,
       SUM(Quantity) AS total_quantity,
       SUM(Total_Sales) AS total_sales
FROM retailsales
GROUP BY Product
ORDER BY total_sales DESC;


-- 17. Highest revenue transaction
SELECT *
FROM retailsales
ORDER BY Total_Sales DESC
LIMIT 1;


-- 18. Lowest inventory products
SELECT Product,
       Inventory
FROM retailsales
ORDER BY Inventory ASC
LIMIT 10;


-- 19. Highest selling category
SELECT Category,
       SUM(Total_Sales) AS total_revenue
FROM retailsales
GROUP BY Category
ORDER BY total_revenue DESC
LIMIT 1;


-- 20. Best performing region
SELECT Region,
       SUM(Total_Sales) AS total_revenue
FROM retailsales
GROUP BY Region
ORDER BY total_revenue DESC
LIMIT 1;

