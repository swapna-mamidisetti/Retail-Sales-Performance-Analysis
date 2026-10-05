
-- =========================================================
-- RETAIL SALES PERFORMANCE ANALYSIS
-- Pig Data Cleaning and Transformation
-- =========================================================

-- 1. Load retail sales data from HDFS
sales = LOAD '/retailsalesdataset/retail_sales.csv'
USING PigStorage(',')
AS (
    sales_ID:int,
    Sale_Date:chararray,
    Product:chararray,
    Category:chararray,
    Region:chararray,
    Quantity:int,
    Unit_Price:int,
    Total_Sales:int,
    Inventory:int
);

-- 2. Remove records with missing important values
clean_sales = FILTER sales BY
    sales_ID IS NOT NULL AND
    Sale_Date IS NOT NULL AND
    Product IS NOT NULL AND
    Category IS NOT NULL AND
    Region IS NOT NULL AND
    Quantity IS NOT NULL AND
    Total_Sales IS NOT NULL AND
    Inventory IS NOT NULL;

-- 3. Remove invalid sales records
valid_sales = FILTER clean_sales BY
    Quantity > 0 AND
    Unit_Price > 0 AND
    Total_Sales >= 0 AND
    Inventory >= 0;

-- 4. Select required standardized fields
standardized_sales = FOREACH valid_sales GENERATE
    sales_ID,
    Sale_Date,
    Product,
    Category,
    Region,
    Quantity,
    Unit_Price,
    Total_Sales,
    Inventory;

-- 5. Display cleaned data
DUMP standardized_sales;

-- 6. Store cleaned data in HDFS
STORE standardized_sales
INTO '/retailsalesdataset/cleaned_retail_sales'
USING PigStorage(',');
