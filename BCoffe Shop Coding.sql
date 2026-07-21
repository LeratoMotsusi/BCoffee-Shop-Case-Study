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


----Calculating Revenue
SELECT SUM(transaction_qty * unit_price) AS Total_Revenue
FROM bright.coffee.shop;


















