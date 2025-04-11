use northwind;
-- Create a report that shows the average UnitPrice rounded to the next whole number,
-- total price of UnitsInStock and maximum number of orders from the products table. 
-- All saved as AveragePrice, TotalStock and MaxOrder respectively
select round(avg(unitprice)) as AveragePrice, sum(unitsinstock) as TotalStock, max(unitsonorder) as MaxOrder
from products
order by max(unitsonorder) desc;

-- Create a report that shows the SupplierID, CompanyName, CategoryName, 
-- ProductName and UnitPrice from the products, suppliers and categories table
select suppliers.supplierid, suppliers.companyname, categories.categoryname, products.productname, products.unitprice
from products 
join suppliers  on suppliers.supplierid = suppliers.supplierid
join categories  on categories.categoryid = categories.CategoryID;

--  Create a report that shows the CustomerID, sum of Freight,
-- from the orders table with sum of freight greater 
-- $200, grouped by CustomerID. HINT: you will need to use a Groupby and a Having statement

select customerid, sum(freight)
from orders
group by customerid
having sum(freight) > 200 ;

-- Create a report that shows the OrderID, ContactName, UnitPrice,
-- Quantity, Discount from the order details, orders and customers table with discount given on every purchase.

select o.orderid, c.contactname, od.unitprice, od.quantity, od.discount
from `order details` od
join orders o on o.orderid = o.orderid
join customers c on c.contactname = c.contactname;

-- or
select o.orderid, c.contactname, od.unitprice, od.quantity, od.discount
from orders o
join `order details` od on o.orderid = od.orderid
join customers c on o.customerid = c.customerid;


-- Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and 
-- FirstName of who they report to as manager from the employees table sorted by Employee ID. 
-- HINT: This is a SelfJoin. 

SELECT e.EmployeeID, 
	concat(e.lastname, ' ', e.firstname) as employeename,
    concat(e.lastname, ' ', e.firstname) as managername
FROM employees e
LEFT JOIN employees m ON e.employeeid = m.EmployeeID
ORDER BY e.EmployeeID;

-- Create a report that shows the average, 
-- minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively

select avg(unitprice) as averageprice, min(unitprice) as minimumprice, max(unitprice) as maximumprice
from products;
 
  -- create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo 
select substring(categoryname, 1, 5) as shortinfo
from categories;


-- Create a copy of the shipper table as shippers_duplicate. T
-- then insert a copy of shippers data into the new table HINT: Create a Table, 
-- use the LIKE Statement and INSERT INTO statement. 

create table shippers_duplicate
like shippers;
insert into shippers_duplicate
select *
from shippers;

alter table shippers_duplicate
add email varchar(50);

update shippers_duplicate set email ='shippers1@gmail.com' where shipperid = 1;
update shippers_duplicate set email ='shippers2@gmail.com' where shipperid = 2;
update shippers_duplicate set email ='shippers3@gmail.com' where shipperid = 3;

-- Create a report that shows the CompanyName and ProductName from all product in the Seafood category. 
select s.companyname, p.productname, c.categoryname
from products p
join suppliers s on s.companyname = s.companyname
join categories c on c.categoryname = c.categoryname
where categoryname = 'seafood';


-- Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5
select p.categoryid, s.companyname, p.productname
from products p
join suppliers s on s.companyname = s.companyname
where categoryid = 5;

-- Create a select statement that outputs the following from the shippers_duplicate Table
select shipperid, companyname, phone
from shippers_duplicate;

-- Delete the shippers_duplicate table
drop table shippers_duplicate;

-- Create a report that the CompanyName and total number of 
-- orders by customer renamed as number of orders since December 31, 1994. 
-- Show number of Orders greater than 10
select c.companyname, o.customerid, count(orderid) as TotalNumberOfOrders
from orders o
join customers c on o.customerid = c.customerid
where orderdate > 31-12-1994
group by 1,2
having count(orderid) > 10
order by count(orderid) desc;

-- Create a select statement that ouputs the following from the product table NB: It should return 77rows
select concat(productname, 'weigh/s', quantityperunit, 'and costs $', round(unitprice)) as productinfo
from products;

-- Create a select statement that ouputs the following from the employees table.
--  NB: The age might differ depending on the year you are attempting this query
select lastname, firstname, title, year(now()) - year(birthdate) as age 
from employees;

--  Create a report that shows the ContactName of
-- all customers that do not have letter A as the second alphabet in their Contactname. 

select contactname
from customers
where substring(contactname, 2, 1)!= 'A';


--  Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address,
-- City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers 
-- and orders table. HINT: Create a View
create view customerinfo as
select c.customerid, c.companyname, c.contactname, c.contacttitle, c.address, c.city,
 c.country, c.phone, o.orderdate, o.requireddate, o.shippeddate
 from customers c
 join orders o on c.customerid = o.customerid;

-- Change the name of the view you created from customerinfo to customer details.
drop view customerinfo;

create view customerdetails as
select c.customerid, c.companyname, c.contactname, c.contacttitle, c.address, c.city,
 c.country, c.phone, o.orderdate, o.requireddate, o.shippeddate
 from customers c
 join orders o on c.customerid = o.customerid;

-- Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, 
-- Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder,
-- ReorderLevel, Discontinued from the supplier, products and categories tables. HINT: Create a View 41
create view productdetails as
select p.productid, s.companyname, c.categoryname, c.description, p.quantityperunit, p.unitprice, 
p.unitsinstock, p.unitsonorder, p.reorderlevel, p.discontinued
from products p
join categories c on c.categoryname = c.categoryname
join suppliers s on s.companyname = s.companyname;

-- Drop the customer details view.
drop view customerdetails;



 


-- 
 
