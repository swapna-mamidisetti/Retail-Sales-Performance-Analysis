-- =========================================================
-- RETAIL SALES PERFORMANCE ANALYSIS
-- Hive Query Optimization
-- Partitioning and Bucketing
-- =========================================================

-- 1. Create partitioned table
CREATE TABLE IF NOT EXISTS retail_sales_partitioned (
    sales_ID INT,
    Product STRING,
    Category STRING,
    Region STRING,
    Quantity INT,
    Unit_Price INT,
    Total_Sales INT,
    Inventory INT
)
PARTITIONED BY (Sale_Date STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;


-- 2. Create bucketed table
CREATE TABLE IF NOT EXISTS retail_sales_bucketed (
    sales_ID INT,
    Sale_Date STRING,
    Product STRING,
    Category STRING,
    Region STRING,
    Quantity INT,
    Unit_Price INT,
    Total_Sales INT,
    Inventory INT
)
CLUSTERED BY (Region)
INTO 4 BUCKETS
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;


-- 3. Enable bucketing
SET hive.enforce.bucketing=true;


-- 4. Enable dynamic partitioning
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;


-- 5. Example optimized regional query
SELECT Region,
       SUM(Total_Sales) AS total_revenue
FROM retailsales
GROUP BY Region
ORDER BY total_revenue DESC;


-- 6. Example monthly revenue query
SELECT SUBSTR(Date,1,7) AS month,
       SUM(Total_Sales) AS monthly_revenue
FROM retailsales
GROUP BY SUBSTR(Date,1,7)
ORDER BY month;
