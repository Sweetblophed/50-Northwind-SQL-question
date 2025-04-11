use northwind;
-- write a query that returns the top ten orders with the most line item


select productid, count(orderid)
from `order details`
group by productid
order by count(orderid) desc
limit 10;

-- write a query that shows customer id, sum of freight from the orders table 
      -- with sum of freight greater than 200 group by customerid
select customerid, sum(freight)
from orders
group  by customerid
Having sum(freight) > 200;

-- Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName
select categoryname, description 
from categories;

-- Create a report that shows the ContactName, CompanyName, ContactTitle 
-- and Phone number from the customers table sorted by Phone.

select phone, contactname, companyname, contacttitle
from customers
order by phone;

-- Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname
-- respectively and HireDate from the employees table sorted from the newest to the oldest employee.

select hiredate, upper(firstname) as firstname, upper(lastname) as lastname
from employees
order by hiredate desc;

-- Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, 
-- Freight from the orders table sorted by Freight in descending order
select freight, orderid, orderdate, shippeddate, customerid
from orders
order by freight desc
limit 10;

-- create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
select lower(customerid) as ID
from customers;

-- Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the 
-- suppliers table sorted by the Country in descending order then by CompanyName in ascending order
select country, companyname, fax, phone, homepage
from suppliers
order by country desc;

select companyname, country, fax, phone, homepage
from suppliers
order by companyname asc;

-- Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only
select contactname, companyname, city
from customers
where city = 'buenos aires' ;


-- Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
select quantityperunit, productname,  unitprice, unitsinstock
from products
where unitsinstock = 0 ;

-- Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain
select contactname, address, city
from customers
where city != 'germany' and city != 'mexico' and city != 'spain'; 

-- Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
select orderdate, shippeddate, customerid, freight
from orders
where orderdate = '1996-05-21 00:00:00' ;

-- Create a report showing FirstName, LastName, Country from the employees not from United States
select firstname, lastname, country
from employees
where country != 'united states' ;

-- Create a report that showsthe EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
 -- from all orders shipped later than the required date.
 select employeeid, orderid, customerid, requireddate, shippeddate
 from orders
 where shippeddate != requireddate ;
 
 -- Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
select city, companyname, contactname
from cuStomers
where city LIKE 'A%' OR 'B%' ;

-- Create a report showing all the even numbers of OrderID from the orders table.
SELECT orderid
from orders
where mod (orderid, 2) = 0 ;

-- Create a report that shows all the orders where the freight cost more than $500.
select *
from orders
where freight > 500 ;

-- Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel 
-- of all products that are up for reorder.
select productname, unitsinstock, unitsonorder, reorderlevel
from products
where reorderlevel > 1 ;

-- Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
select companyname, contactname, fax
from customers
where fax is null ;

-- Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
select firstname, lastname, reportsto
from employees
where reportsto is null;

-- Create a report showing all the odd numbers of OrderID from the orders table.

select orderid
from orders
where mod(orderid, 2) = 1;

-- Create a report that shows the CompanyName, ContactName, Fax of all 
-- customers that do not have Fax number and sorted by ContactName
select  contactname, companyname, fax
from customers
where fax is null
order by contactname;

-- Create a report that shows the City, CompanyName, ContactName of customers from 
-- cities that has letter L in the name sorted by ContactName.
select contactname, city, companyname
from customers
where city like 'L%'
order by contactname;

-- Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
select firstname, lastname, birthdate
from employees
where birthdate = '1950-01-01' and '1950-12-31' ;

-- Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
select firstname, lastname, (birthdate) as 'birth year'
from employees;

-- Create a report showing OrderID, total number of Order ID as NumberofOrders
-- from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order

select orderid, count(orderid) as numberoforders
from `order details` 
group by orderid
order by numberoforders desc;

-- Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids,
-- Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
select supplierid, productname, companyname
from products
where productname = 'exotic liquids' and productname = 'speciality biscuits' and productname = 'ltd.' and productname = 'escargots nouveaux'
order by supplierid;

-- Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, 
-- ShipAddress of all orders with ShipPostalCode beginning with "98124".
select shippostalcode, orderid, orderdate, requireddate, shippeddate, shipaddress
from orders
where shippostalcode = '98124';

-- Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the
-- has no "Sales" in their ContactTitle
select contactname, contacttitle, companyname
from customers
where contacttitle NOT LIKE '%sales';

-- Create a report that shows the LastName, FirstName, City of employees in cities other than "Seattle";
select lastname, firstname, city
from employees
where city != 'seattle' ;

-- Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in 
-- any city in Mexico or other cities in Spain other than Madrid.
select companyname, contacttitle, city, country
from suppliers
where country = 'mexico' or country = 'spain' and city <>'madrid';

-- question 30

select concat(firstname, ' ', lastname, 'can be reached at ', phoneextension) as contactinfo
from employees
where 
(firstname = 'nancy' and lastname ='davolio' and phoneextension = 'x546') OR
(firstname = 'andrew' and lastname = 'fuller' and phonextension = 'x3457') OR
(FIRSTNAME = 'JANET' AND LASTNAME = 'LEVERLING' AND PHONEEXTENSION = 'x3355') OR
(FIRSTNAME = 'MARGARET' AND LASTNAME = 'PEACOCK' AND PHONEEXTENSION = 'x5176') OR
(FIRSTNAME = 'steven' AND LASTNAME = 'buchanan' AND PHONEEXTENSION = '3453') OR
(FIRSTNAME = 'micheal' AND LASTNAME = 'suyama' AND PHONEEXTENSION = 'x428') OR
(FIRSTNAME = 'robert' AND LASTNAME = 'king' AND PHONEEXTENSION = 'x465') OR
(FIRSTNAME = 'laura' AND LASTNAME = 'callahan' AND PHONEEXTENSION = '2344') OR
(FIRSTNAME = 'anne' AND LASTNAME = 'dodsworth' AND PHONEEXTENSION = 'x452'); 
