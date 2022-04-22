--Q1:
--On the sales schema of the SalesOrderDetail table, write a query that lists 
--the SalesOrderID and ProductID columns provided that the OrderQty equals 2.

select sod.SalesOrderDetailID, sod.ProductID
from Sales.SalesOrderDetail sod
where sod.OrderQty = 2


--Q2:
--Write a query that sticks the name of each product to the product number using an UnderLine symbol.
--Hint: Production Schema Product table, Name column, and productNumber

select pp.Name as 'Name', pp.ProductNumber as 'Num', 
pp.Name+'_'+pp.ProductNumber as Name_Num 
from Production.Product pp

--Q3:
--Rewrite the above practice query for the first 1000 rows.

select TOP (1000) 
pp.Name as 'Name', pp.ProductNumber as 'Num', 
pp.Name+'_'+pp.ProductNumber as Name_Num 
from Production.Product pp


--Q4:
--Rewrite Exercise 2 query provided the product ID is between 300 and 800. (ProductID)

select pp.Name as 'Name', pp.ProductNumber as 'Num',
pp.Name+'_'+pp.ProductNumber as Name_Num 
from Production.Product pp
where pp.ProductID between 400 and 600


--Q5:
--Write the name of all the products that contain the phrase Mountain with the condition of the product ID between 200 and 300 and 
--put the name of the column displayed in the result as MountainProduct.

select pp.Name as MountainProduct
from Production.Product pp 
where pp.ProductID between 400 and 600 and 
pp.Name like '%Mountain%' 
-- =
select p.Name as Moun
from Production.Product as p
where p.Name like '%Mountain%'
and p.ProductID >= 400
and p.ProductID <= 600

--Q6:
--Rewrite the above exercise for all products whose weight is specified (Weight column)

select pp.Name as MountainProduct
from Production.Product pp 
where pp.ProductID between 400 and 600 and 
pp.Name like '%Mountain%' and 
pp.Weight is not null


--Q7:
--In Production Schema and ProductDescription table, 
--select rows whose string length in the Description column is more than 20 characters.

select * 
from Production.ProductDescription ppd
where len(ppd.Description) > 20