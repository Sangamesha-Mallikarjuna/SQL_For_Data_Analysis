# SQL_For_Data_Analysis
SQL Practice Queries – ClassicModels Database

This repository contains a SQL script that includes basic to advanced SQL queries written using the ClassicModels sample database.
The queries cover essential SQL concepts such as SELECT, WHERE, ORDER BY, GROUP BY, JOIN, subqueries, and creating views.

📂 File Included
Sangamesha Mallikarjuna Task 3.sql

This file contains queries related to:

Basic SELECT statements

WHERE filtering

ORDER BY sorting

Aggregate functions (SUM, COUNT, AVG, MAX, MIN)

GROUP BY & HAVING

JOIN queries (INNER, LEFT, RIGHT)

Subqueries

Creating Views

Query optimization using indexes

🗄️ Prerequisites

To run these queries, you need:

✔ MySQL Server (5.7 or 8.x)
✔ ClassicModels Sample Database

If you don’t have the ClassicModels DB, download it online and import it:

mysql -u root -p < classicmodels.sql

✔ A SQL Client

Such as MySQL Workbench, DBeaver, phpMyAdmin, or CLI.

▶️ How to Run the SQL File
Option 1: MySQL Command Line
mysql -u your_username -p classicmodels < "Sangamesha Mallikarjuna Task 3.sql"

Option 2: MySQL Workbench

Open Workbench

Load the .sql file

Select all queries

Run them one by one

📘 What’s Inside the Query File?
🔹 1. Basic SELECT Queries

Examples like:

SELECT * FROM customers;
SELECT productName, productLine FROM products;

🔹 2. WHERE Filtering
SELECT customerName FROM customers WHERE country = 'USA';

🔹 3. ORDER BY Sorting
SELECT productName FROM products ORDER BY buyPrice DESC;

🔹 4. Aggregate Functions & GROUP BY
SELECT productLine, AVG(buyPrice)
FROM products
GROUP BY productLine;

🔹 5. JOIN Queries

Covers INNER, LEFT, and RIGHT joins.

SELECT p.productName, pl.textDescription
FROM products p
INNER JOIN productlines pl ON p.productLine = pl.productLine;

🔹 6. Subqueries
SELECT customerName
FROM customers
WHERE creditLimit > (SELECT AVG(creditLimit) FROM customers);

🔹 7. Creating Views

Reusable virtual tables for analysis.

🔹 8. Query Optimization using Indexes

Examples showing how adding indexes improves performance.
Learning Outcome

After running this SQL file, you will understand:

How to extract, filter, and sort data

How to join multiple tables

How grouping and aggregation works

How to create subqueries

How views help simplify analysis

How indexes improve query speed
