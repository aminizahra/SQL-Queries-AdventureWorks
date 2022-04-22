--Session3:

-- 1: Show Distinct Records Between 2 Tables :
-- Except & Intersect

-- >> ** Show Diagram

SELECT ProductID FROM Production.Product
 INTERSECT
SELECT ProductID FROM Production.WorkOrder ;

SELECT ProductID FROM Production.Product
 Except 
SELECT ProductID FROM Production.WorkOrder ;

--EXCEPT:
--Displays records that exist in the first query (left) and do not exist in the second query (right). 
--In simpler terms, records are in the first and not in the second.

--INTERSECT:
--Displays records that are shared in both queries.

-- Q : Intersect  Sales.salesOrderDetail.ProductId  AND Purchasing.PurchaseOrderDetail.ProductID
----------------------------------------------------

-- 2: Insert Into Table
--Figure 1:

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...); 

--Samples :
        create table Sample_2 (id int , name varchar(10) , family  varchar (20))
        
        insert into Sample_2 (id,name,family)
        values (3,'ali','akbari'),
        	   (2,'maryam','ehsani'),
        	   (2,'maryam','ehsani')
        
        insert into Sample_2
        values (4,'neda','amiri'),
        	(5,'hasan','elahi')
        
        insert into Sample_2
        values (6,'amiri')
        
        insert into Sample_2 (id,family)
        values (6,'amiri')

		 insert into Sample_2 (id,name)
        values (6,'reza')
        
        select * from Sample_2
        
        create table Sample_id (id int identity , fname varchar (30))  
        
        insert into Sample_id (fname)
        values ('elnaz')
        
        insert into Sample_id 
        values (5)
        
        insert into Sample_id 
        values ('')

		insert into Sample_id 
        values (null)

		insert into Sample_id 
        values ('null')
        
        select * from Sample_id

		-- Continue of Queries are in the Alter table file
--figure 2:

INSERT INTO table_name           
VALUES (value1, value2, value3, ...); 

--Q: Create Table Insert_Sample (FirstName varchar(30), midname varchar(30),LastName varchar(30)) --> Insert into by 2 figures
-- create table test (id int identity,Fname varchar(30))

insert into insert_sample (FirstName,midname,LastName) values('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','k','5')
----------------------------------------------------

-- 3 : Null Value 
SELECT column_names FROM table_name WHERE column_name IS NULL; 

SELECT column_names FROM table_name WHERE column_name IS Not NULL;
--Q : Find Title in person table for Null and not null
select *  from Person.Person p where p.Title is null
select *  from Person.Person p where p.Title is not null
----------------------------------------------------
-- 4 count 
-- select * from Person.Person p where p.FirstName = 'Michael' 
z
select count(*) as number from person.Person as p
	where p.FirstName = 'Michael'

-- 4-1 : Count Null
select * from Person.Person
select count(*) as number from person.Person  -- 19972
-->> Important  Count(*)  NOT  Count(Title)

-- >> ** Show Diagram Of Union
select count(Title) from Person.Person

select count(*) from Person.Person where title is null
  
select count(*) from Person.Person where title is not null

select count(*) from Person.Person where title is null OR Title is not null

go
select Title from Person.Person where title is null
 Union 
select Title from Person.Person where title is not null
go
select Title from Person.Person where title is null
 Union all
select Title from Person.Person where title is not null
----------------------------------------------------

-- 5 : Update

UPDATE table_name
 SET column1 = value1, column2 = value2, ...
WHERE condition; 

-- Q:  update Person.person.middleName to Test  where firstname:David and Lastname:Bradley
----------------------------------------------------

-- 6 : Delete

DELETE FROM table_name WHERE condition; 

-- Q:  Delete Person.person.middleName  where middleName=test
----------------------------------------------------

-- 7 : Select Top 
select * from Person.Person

SELECT TOP number|percent column_name(s) FROM table_name WHERE condition; 

select top 10 * from Person.Person where BusinessEntityID between 400 and 800

select  top 20 percent * from Person.Person where BusinessEntityID between 400 and 800

-- Q: select top 10 in Person.person + select top 5 in Person.person where First:ken + select top 5 percent in Person.person where First:ken
----------------------------------------------------
-- 8 : 

SELECT MIN(column_name) FROM table_name WHERE condition; 
SELECT Max(column_name) FROM table_name WHERE condition; 

--Q : min & Max sales.SalesOrderDetail.Unitprice 
select * from Sales.SalesOrderDetail sod
select max(sod.UnitPrice) as mx,min(sod.UnitPrice) as mn from Sales.SalesOrderDetail sod 
select max(sod.UnitPrice),sod.ProductID from Sales.SalesOrderDetail sod group by ProductID


----------------------------------------------------
-- 9 : COUNT(), AVG() and SUM() Functions
SELECT COUNT(column_name) FROM table_name WHERE condition; 
SELECT avg(column_name) FROM table_name WHERE condition; 
SELECT sum(column_name) FROM table_name WHERE condition; 

select AVG(UnitPrice) from Sales.SalesOrderDetail where ProductID=958

select sum(LineTotal) from Sales.SalesOrderDetail where ProductID=958

-- Q : avg sales.SalesOrderDetail.Unitprice where productid=958
----------------------------------------------------

-- 10 : LIKE Operator
SELECT column1, column2 FROM table_name WHERE columnN LIKE pattern; 

-- ** Patterns :
--	WHERE FirstName LIKE 'a%' 	   start with "a"
--	WHERE FirstName LIKE '%a' 	   end with "a"
--	WHERE FirstName LIKE '%or%'    have "or" in any position
--	WHERE FirstName LIKE '_r%' 	   have "r" in the second position
--	WHERE FirstName LIKE 'a_%' 	   start with "a" and are at least 2 characters in length
--	WHERE FirstName LIKE 'a__%'    start with "a" and are at least 3 characters in length
--	WHERE FirstName LIKE 'a%o' 	   start with "a" and ends with "o"
select * from Person.Person where FirstName like 'B%Y'
--Q: select * from Person.Person where (All Of Patterns)
----------------------------------------------------
-- 11 : Wildcards 

SELECT * FROM person.Address WHERE City LIKE '_ondon';
SELECT * FROM person.Address WHERE City LIKE 'L_n_on';
SELECT * FROM person.Address WHERE City LIKE '[lon]%';
SELECT * FROM person.Address WHERE City LIKE '[a-h]%';

----------------------------------------------------
-- 12 : 'IN' And 'Not IN' Operator 

SELECT column_name(s) FROM table_name WHERE column_name  IN (value1, value2, ...); 

select * from Person.Address p 
	where p.AddressID  IN (11694,11707,11732,11740,11746,11749)

select * from Person.Address p 
	where p.AddressID not IN (11694,11707,11732,11740,11746,11749)

select * from Person.Address p
where p.AddressID in (select AddressID from Person.Address where City = 'Bothell')

select name , ProductNumber 
from Production.Product p
where P.ProductID
in (select sod.ProductID from Sales.SalesOrderDetail sod ) 

--Q: in sales.SalesOrderDetail select * where product id IN/NOT IN (776,772)
--Here in parentheses can be written a query that is the subject of the subquery.
----------------------------------------------------
-- 13 : BETWEEN Operator

SELECT column_name(s) FROM table_name WHERE column_name BETWEEN value1 AND value2; 
-- Q: in sales.SalesOrderDetail OrderQty between 5 and 9

----------------------------------------------------

-- >> |**********|
-- 14 : JOIN 
-- >  Show Diagram Of JOIN
-- Q: Open Query Of JOIN

----------------------------------------------------
-- 15 : Left() , Right()

select LEFT(fieldname,2)
from ....
where ....
  
  select p.Name,LEFT(p.Name,3) from Production.Product p
  select p.Name,right(p.Name,3) from Production.Product p
    select p.Name,LEFT(p.Name,3) as l,right(p.Name,3) as r from Production.Product p

  -- Sample :
	select p.FirstName,left(FirstName,3) L2 , p.LastName,right(LastName,2) R2 from Person.Person p

-- >> SUBSTRING
-- >> CHARINDEX

----------------------------------------------------
-- 16 : cast () , convert ()

SELECT 9.5 AS Original, CAST(9.5 AS int) AS 'integer',CAST(119.5 AS decimal(10,7)) AS 'decimalNum';

SELECT 9.5 AS Original, CONVERT(int, 9.5) AS 'integer',CONVERT(decimal(7,4), 119.5) AS 'decimalNum';


select sod.UnitPrice, Cast(sod.UnitPrice as varchar(max))
	,CONVERT(varchar , sod.UnitPrice) as 'convert' 
from Sales.SalesOrderDetail sod
-- search in google : Cast VS Convert in sql server
----------------------------------------------------
-- 17 : Date

select GETDATE()

select cast(GETDATE() as time)

select DATEADD(day,+2,'20220831')
select DATEADD(MONTH,-3,GETDATE())

-- select DATEADD(day,5,'20220831')
-- +5 223423.380000

select max(s.ModifiedDate) , min(s.ModifiedDate)
from Sales.SalesOrderDetail s

-- 223423.380000
-- 0
select sum(LineTotal) 
from Sales.SalesOrderDetail sod 
where sod.ModifiedDate between '2013-09-03 00:00:00.000' and DATEADD(DAY,-5,'2013-09-03 00:00:00.000') 

--select sum(LineTotal) from Sales.SalesOrderDetail sod where sod.ModifiedDate between DATEADD(DAY,-5,'2013-09-03 00:00:00.000') and '2013-09-03 00:00:00.000'  

SELECT DATEADD(DAY, -2, cast(GETDATE() as date) );
SELECT DATEADD(DAY, -2, GETDATE()  );
SELECT DATEADD(DAY, -2, cast(GETDATE() as date) );


SELECT DATEADD(MONTH, -1, cast(GETDATE() as date) );
SELECT DATEADD(month, 1, '20060831');
SELECT DATEADD(year,2, '20060731');
SELECT DATEADD(year,-5, '20060731');
go


select datediff(Part,Date2,date1)
SELECT DATEDIFF(SECOND, '2007-05-05 12:05:09.3312722', getdate());

-- parametric :
   declare @date date
   set @date = '2007-05-05 12:05:09.3312722'
   SELECT DATEDIFF(SECOND, @date, getdate());
go

SELECT DATENAME(year, '2007-05-05 12:05:09.3312722')
,DATENAME(month, '2007-05-05 12:05:09.3312722')
,DATENAME(day, '2007-05-05 12:05:09.3312722')
,DATENAME(dayofyear, '2007-05-05 12:05:09.3312722')
,DATENAME(weekday, '2007-05-05 12:05:09.3312722')
,DATENAME(weekday, GETDATE());
go

-- sample:
select sum(LineTotal) 
-- ,  year(sod.ModifiedDate)
from Sales.SalesOrderDetail as sod
where 
 datename(MONTH,sod.ModifiedDate) = datename(month,getdate())
-- group by year(sod.ModifiedDate)
-- and 

select sum(LineTotal) 
-- ,  year(sod.ModifiedDate)
from Sales.SalesOrderDetail as sod
where 
datename(WEEKDAY,sod.ModifiedDate) = 'friday'



SELECT DAY('2015-04-30 01:01:01.1234567');
SELECT month('2015-04-30 01:01:01.1234567');
SELECT year('2015-04-30 01:01:01.1234567');

-- sample :
select sum(LineTotal) 
from Sales.SalesOrderDetail as sod
where month(sod.ModifiedDate) between 1 and 3

SELECT ModifiedDate date ,year(ModifiedDate) 'year',month(ModifiedDate)'month',day(ModifiedDate) 'day'
  into dateTable
  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]

-- datepart

--Subtract 5 years from the current date
--Add 2 months to the current date
--When 5 days are deducted from the current date, the name of the day should be stated
--When 147 days are deducted from the current date, the distance between the result and the current date is checked in terms of months



 select year(GETDATE()) -5
 select dateadd(year,-5,getdate())

 select month(getdate()) +2  -- !!!
 select dateadd(month,2,getdate())

 select datename(weekday,getdate()-5)
 select datename(weekday,dateadd(day,-5,getdate()))

 select datediff(month,getdate()-147,getdate())
 select datediff(month,dateadd(day,-147,GETDATE()),getdate())

 select datediff(month,dateadd(day,-147,getdate()),getdate())

  select datediff(month,getdate(),dateadd(day,+147,getdate()))
