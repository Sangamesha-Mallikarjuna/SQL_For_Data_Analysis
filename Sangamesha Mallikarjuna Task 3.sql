use classicmodels;
-- select queries
select * from customers;

-- query to view customersName and city  
select customerName,city from customers;

-- query to view product name and price
select productName,buyPrice from products;

-- where queries
-- view customers from USA
select customerName,country
from customers
where country = "USA";
-- view orders with status shipped
select orderNumber,status 
from orders
where status = "shipped";

-- Order by queries
-- view Products sorted by price
select productName,buyPrice
from products
order by buyPrice DESC;

-- view customers sorted by customerName

select customerName,city 
from customers
order by customerName asc

-- group by queries
-- total number of customers by country
select country,count(*) as totalCustomers
from customers
group by country;
-- total orders placed by each cusotmer
select customerNumber,count(orderNumber) as totalOrders
from orders
group by customerNumber;
-- join+group by query
-- view  each customer and total amount spent
select c.customerName,sum(p.amount) as totalSpent
from customers c
inner join payments p on c.customerNumber = p.customerNumber
group by c.customerName
order by totalSpent DESC;
-- order with their order details
select p.productName,p.productLine,pl.textDescription
from products p
inner join productlines pl
on p.productLine = pl.productLine;

-- customers and their payments view even customers without payments
SELECT c.customerName, p.amount, p.paymentDate
FROM customers c
LEFT JOIN payments p
ON c.customerNumber = p.customerNumber;
employees and their manager
SELECT e.firstName AS Employee,
       m.firstName AS Manager
FROM employees e
LEFT JOIN employees m
    ON e.reportsTo = m.employeeNumber;
 --    right joins
--  Offices and Employees even if office has no employees
SELECT o.city, e.firstName, e.lastName
FROM employees e
RIGHT JOIN offices o
    ON e.officeCode = o.officeCode;
    
SELECT c.customerNumber, c.customerName, p.amount
FROM customers c
LEFT JOIN payments p
    ON c.customerNumber = p.customerNumber

UNION

SELECT c.customerNumber, c.customerName, p.amount
FROM customers c
RIGHT JOIN payments p
    ON c.customerNumber = p.customerNumber;

-- subqueries
SELECT c.customerNumber,
       c.customerName,
       (SELECT COUNT(*) FROM orders o WHERE o.customerNumber = c.customerNumber) AS orders_count
FROM customers c
ORDER BY orders_count DESC;

SELECT p.productCode, p.productName, p.productLine, p.buyPrice
FROM products p
WHERE p.buyPrice > (
    SELECT AVG(p2.buyPrice)
    FROM products p2
    WHERE p2.productLine = p.productLine
);
-- view for analysis
-- example: customer payments summary view
CREATE OR REPLACE VIEW vw_customer_payments_summary AS
SELECT
  c.customerNumber,
  c.customerName,
  COALESCE(SUM(p.amount),0) AS totalPaid,
  COUNT(p.customerNumber) AS paymentCount,
  MAX(p.paymentDate) AS lastPaymentDate
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber, c.customerName;


SELECT * FROM vw_customer_payments_summary ORDER BY totalPaid DESC LIMIT 10;

-- optimize queries with indexes
CREATE INDEX idx_payments_customer_date_amount ON payments(customerNumber, paymentDate, amount);

CREATE INDEX idx_orders_customer_orderdate_status ON orders(customerNumber, orderDate, status);

SHOW INDEX FROM payments;
SHOW INDEX FROM orderdetails;






