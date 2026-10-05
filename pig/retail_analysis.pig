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

DUMP sales;
