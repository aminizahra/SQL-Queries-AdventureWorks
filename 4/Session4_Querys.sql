--Session4

-- 1: Try_Cast , Try_convert :

SELECT TRY_CAST('12/31/2010' AS int) AS Result; 
SELECT TRY_CAST('12/31/2010' AS datetime2) AS Result;

SELECT TRY_CONVERT(DECIMAL(8,4), 1429.5431) AS DECIMAL;
SELECT TRY_CONVERT(DECIMAL(8,2), 1429.543) AS DECIMAL;
SELECT TRY_CONVERT(DECIMAL(6,3), 1429.543) AS DECIMAL;

 select s.UnitPrice,
 TRY_CAST(s.UnitPrice as decimal(4,2)) 'Test' 
 from sales.SalesOrderDetail s

 select LineTotal,
 TRY_CONVERT( decimal(5,2) , p.LineTotal) 
 from Purchasing.PurchaseOrderDetail p

--Q : try_convert  Purchasing.PurchaseOrderDetail.linetotal for decimal(7,3)
-----------------------------------------------------------------
go
-- 2: Group BY :

-- (COUNT(), MAX(), MIN(), SUM(), AVG())
SELECT column_name(s) 
 FROM table_name 
WHERE condition
 GROUP BY column_name(s)
ORDER BY column_name(s); 

select * from Sales.SalesOrderDetail where ProductID = 776

select ProductID from Sales.SalesOrderDetail group by ProductID
	
	select ProductID,sum(p.OrderQty) sarjam 
	from sales.SalesOrderDetail p 
	group by ProductID 
	order by sum(p.OrderQty) desc

	select ProductID,Count(s.OrderQty) 'Order_count' 
	from sales.SalesOrderDetail s 
	group by ProductID 
	order by ProductID desc

-- Q: Group By sales.SalesOrderDetail by productId , productName  ( JOIN ) 
-- Q : gropu by Name,ProductID ON Sales.SalesOrderDetail  with Qty Counting

-- sample 1 :
select p.Name ,count(sod.ProductID) as 'Count'
 from Sales.SalesOrderDetail as sod
 left join Production.Product as p ON sod.ProductID=p.ProductID
group by p.Name,sod.ProductID
go

-- sample 2 :
select p.Name , sum(OrderQty) as SaleSum
from Sales.SalesOrderDetail as sod
left join Production.Product as p On sod.ProductID = p.ProductID
group by p.Name

-----------------------------------------------------------------
go
-- 3: Having 

SELECT column_name(s)
 FROM table_name
  WHERE condition
GROUP BY column_name(s)
 HAVING condition
  ORDER BY column_name(s);
  

 select sod.ProductID,p.Name,count(sod.ProductID) cnt
 from Sales.SalesOrderDetail sod
  JOIN Production.Product P ON Sod.ProductID=p.ProductID
  --where  ....
group by sod.ProductID,p.Name 
  having count(sod.ProductID) > 1000
order by count(sod.ProductID) desc 

  select ProductID,Sum(unitprice)
   from sales.SalesOrderDetail 
   --where UnitPrice > 20.1865
  group by ProductID
   having sum(UnitPrice)>500000
   order by ProductID desc

-- Q: The report includes the product ID and product name and the total number of 
--registered orders for products with a total order number above 200,000
-----------------------------------------------------------------
go
-- 4 : Exist :

SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);
go

select top 10 * from Person.Person
select top 10 * from HumanResources.Employee

SELECT a.FirstName, a.LastName  
FROM Person.Person AS a  
WHERE EXISTS  
(SELECT *   
    FROM HumanResources.Employee AS b  
    WHERE a.BusinessEntityID = b.BusinessEntityID  
    AND a.LastName = 'Adams'
	) ;  
-----------------------------------------------------------------
go
-- 5: Replace () 

SELECT REPLACE('abcdefghicde','cde','xx');  
 -- Q : Person.person REPLACE('firstname','a','X');
-----------------------------------------------------------------
go
-- 6: RTRIM() , Ltrim()

SELECT ltrim(rtrim('          Removes trailing spaces.           '))

-----------------------------------------------------------------
go
-- 7: SPACE() 

SELECT RTRIM(LastName) + ',' + SPACE(5) +  LTRIM(FirstName) as  result  
FROM Person.Person  
ORDER BY LastName, FirstName; 

-----------------------------------------------------------------
go
-- 8: STUFF() 

SELECT STUFF('09121234567', 6, 3, '***'); 
 
-----------------------------------------------------------------

go
-- 9: LEN() 

SELECT LEN(FirstName) AS Length, FirstName, LastName   
FROM Sales.vIndividualCustomer  
WHERE CountryRegionName = 'Australia'; 

-----------------------------------------------------------------
go
-- 10: PATINDEX() 

SELECT position = PATINDEX('%ter%', 'interesting data');  
SELECT position = PATINDEX('%by%', 'name');  

select  p.Name, PATINDEX('%cha%', p.Name) 
from Production.Product p

-----------------------------------------------------------------
go
-- 11: CHARINDEX() 

SELECT CHARINDEX('are', 'Reflectors are vital safety components of your bicycle.'); 
--SELECT patindex('%are%', 'Reflectors are vital safety components of your bicycle.'); 
--Q:
-----------------------------------------------------------------
go

-- 12: SUBSTRING() 

SELECT x = SUBSTRING ('abcdef', 2, 3);  
-- 

select d.Title,SUBSTRING(d.Title,1,5) 'sub' 
from [AdventureWorks2019].[Production].[Document] as d
go
-- Data Type and charachter Code
select * from [AdventureWorks2019].[Production].[Document] as d
select Document,SUBSTRING(d.Document,1,8) from [AdventureWorks2019].[Production].[Document] as d
-----------------------------------------------------------------
go

-- >>>  ***  Mathematical Function *** <<<
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver15

-- 13: CEILING ( numeric_expression )  

SELECT CEILING(123.45),CEILING($123.45), CEILING($-123.45), CEILING($0.0);  

https://fa.wikipedia.org/wiki/%D9%82%D8%AF%D8%B1_%D9%85%D8%B7%D9%84%D9%82_(%D8%B1%DB%8C%D8%A7%D8%B6%DB%8C)
-----------------------------------------------------------------

-- 14: Floor ( numeric_expression )  
SELECT FLOOR(123.45), FLOOR(-123.45), FLOOR($123.45);  

https://fa.wikipedia.org/wiki/%D8%AA%D9%88%D8%A7%D8%A8%D8%B9_%D8%AC%D8%B2%D8%A1_%D8%B5%D8%AD%DB%8C%D8%AD_%D9%88_%D8%B3%D9%82%D9%81
-----------------------------------------------------------------

-- 15: EXP( float_expression ) ,LOG ( float_expression )  

SELECT LOG(10)
SELECT EXP(2.30)
SELECT EXP(LOG(20)), LOG(EXP(20)) 

https://fa.wikipedia.org/wiki/%D8%AA%D8%A7%D8%A8%D8%B9_%D9%86%D9%85%D8%A7%DB%8C%DB%8C
-----------------------------------------------------------------
go


-- 16: POWER ( float_expression , y )  

SELECT POWER(2.0,3);  
SELECT POWER(2.8,3);  
-----------------------------------------------------------------

go
--17: RAND ( [ seed ] )  
-- Returns a pseudo-random float value from 0 through 1, exclusive.

SELECT RAND(100), RAND(), RAND()   

-----------------------------------------------------------------
go

-- 18 : ROUND ( numeric_expression , length [ ,function ] )  

SELECT ROUND(123.9994, 3), ROUND(123.9995, 3);  

-----------------------------------------------------------------

go
-- 19 : SQRT ( float_expression )  

SELECT SQRT(1.00), SQRT(16.00); 

-----------------------------------------------------------------
go
-- 20 :SELECT INTO Statement
-- into new Destination , JUST DATA not index and key and ...

SELECT column1, column2, column3, ...
 INTO newtable [IN externaldb]
FROM oldtable
 WHERE condition; 
 
select top 5 * 
 into Test1
from Person.Person
-- Repeat run

-----------------------------------------------------------------
go

-- 21 :SELECT INTO Statement
-- Target Table Available Before + Data Type Source And destination is Equal

INSERT INTO table2 (column1, column2, column3, ...)
 SELECT column1, column2, column3, ...
  FROM table1
   WHERE condition; 

-- With Error !! :
insert into Test1
select top 15 * 
from Person.Person p
where p.firstname Like '%ad%'
-- Repeat run

select * from test1 T 
order by BusinessEntityid
-----------------------------------------------------------------
go