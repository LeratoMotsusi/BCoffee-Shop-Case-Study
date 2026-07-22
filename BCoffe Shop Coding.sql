-- Databricks notebook source
---1.Checking full table
SELECT *
FROM bright.coffee.shop;


----2.Checking how many rows in the data set and checking for duplicates
SELECT COUNT(*) AS Num_of_rows,
       COUNT(DISTINCT transaction_id) AS user_id
FROM bright.coffee.shop;


---3. Checking for Nulls in some of the columns of the dataset
SELECT COUNT(*) AS NULL_ROWS
FROM bright.coffee.shop
WHERE transaction_id IS NULL
OR transaction_date IS NULL
OR store_id IS NULL
OR product_id IS NULL;


---4.Checking what is the starting date and the ending date of the dataset
SELECT MIN(transaction_date) AS earliest_date,
       MAX(transaction_date) AS latest_date
FROM bright.coffee.shop;


----5.Calculating Revenue
SELECT SUM(transaction_qty * unit_price) AS Total_Revenue
FROM bright.coffee.shop;

---6.Calculating Revenue by changing the data type of the unit_price column to be Double and to have dots instead of commas
SELECT ROUND(SUM(transaction_qty * TRY_CAST(REPLACE(unit_price, ',','.') AS DOUBLE)),2) AS Total_Revenue
FROM bright.coffee.shop;

---7.Checking the distinct branches
SELECT DISTINCT store_location,
                store_id
FROM bright.coffee.shop;


---7.Checking the distinct product categories
SELECT DISTINCT product_category
FROM bright.coffee.shop;

---8.Checking the distinct product types
SELECT DISTINCT product_type
FROM bright.coffee.shop;

---9. Checking the lowest and highest prices in the unit_price column
SELECT MIN(TRY_CAST(REPLACE(unit_price, ',','.') AS DOUBLE)) AS lowest_unit_price,
       MAX(TRY_CAST(REPLACE(unit_price, ',','.') AS DOUBLE)) AS highest_unit_price
FROM bright.coffee.shop;


---10. Checking the Total Revenue by store location
SELECT DISTINCT store_location,
        ROUND(SUM(transaction_qty * TRY_CAST(REPLACE(unit_price, ',','.') AS DOUBLE)),2) AS Total_Revenue
FROM bright.coffee.shop
GROUP BY store_location
ORDER BY Total_Revenue;

 

































