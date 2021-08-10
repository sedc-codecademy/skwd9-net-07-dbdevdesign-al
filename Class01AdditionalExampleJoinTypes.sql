--inner join 
SELECT distinct be.Name as BusinessEnityName, o.OrderDate, o.TotalPrice
FROM dbo.BusinessEntity as be
INNER JOIN dbo.[Order] as o on be.Id=o.BusinessEntityId

--left join
SELECT c.*,o.OrderDate--'//',o.*
FROM dbo.Customer as c
LEFT JOIN dbo.[Order] as o on c.Id=o.CustomerId
WHERE o.CustomerId is null

--right join
SELECT c.*,o.OrderDate
FROM dbo.[Order] o 
RIGHT JOIN	dbo.Customer as c on c.id = o.CustomerId
WHERE o.CustomerId is null


--full join 
SELECT c.*,'//',o.*
FROM dbo.Customer as c
FULL JOIN dbo.[order] as o on c.id = o.CustomerId


--Additional example
SELECT distinct c.name as CustomerName, p.name as ProductName,od.Quantity
FROM dbo.Customer as c
inner join dbo.[Order] as o on c.id = o.CustomerId
inner join dbo.[OrderDetails] as od on o.id = od.OrderId
inner join dbo.Product p on p.id = od.ProductId
WHERE p.Name like 'G%a' AND od.Quantity>=10 AND c.name like '%Kocani'
--ORDER BY C.ID 


SELECT be.id,be.name as businessentityname,sum(totalprice) as sumtotalprice--distinct be.Name as BusinessEnityName, o.OrderDate, o.TotalPrice
FROM dbo.BusinessEntity as be
INNER JOIN dbo.[Order] as o on be.Id=o.BusinessEntityId
--WHERE be.Name = 'Vitalia Bitola'
GROUP BY be.id,be.name
HAVING sum(totalprice)<3000000
ORDER BY be.id desc