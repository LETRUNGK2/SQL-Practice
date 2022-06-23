--Explore dataset
select * from INFORMATION_SCHEMA.tables

select * from products
select * from PropertyInfo
select * from OrderDetails

-- Find max quantity
select p.productname, max(quantity) as MaxQuantity
from OrderDetails o
left join 
Products p 
on o.ProductID = p.ProductID
group by p.ProductName
order by MaxQuantity desc
--find product category that has maximum product
Select productcategory,count(productcategory)
from Products
group by ProductCategory
order by ProductCategory desc
--Find top 5 product id achieved maximum sales in term of quantity 

select top 5 p.productid, sum(o.quantity) as productquantity
from OrderDetails o
left join
products p on 
o.ProductID = p.ProductID
group by p.ProductID
order by productquantity desc
--or 
select top 5 Productid,sum(quantity) as total_quantity
From OrderDetails
group by ProductID
order by 2 desc

-- find top 5 product names has max quantity sales 
select top 5 p.productname,sum(o.quantity) as MaxQuantity
from OrderDetails o 
left join Products p 
on o.ProductID=p.ProductID
group by p.productname 
order by MaxQuantity desc 

--Find top city did maximum sales 
select i.propertycity,p.ProductName,sum(o.quantity*p.Price) as maxsales
from OrderDetails o 
left join Products p 
on o.ProductID=p.ProductID
left join PropertyInfo i
on i.Prop_ID = o.propertyid
group by i.PropertyCity,p.ProductName
order by maxsales desc 



