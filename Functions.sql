--inline table valued function
CREATE FUNCTION dbo.fn_EmployeeDetails (@EmployeeID int)
RETURNS TABLE 
AS
RETURN 
SELECT FirstName,LastName,DateOfBirth,Gender
FROM dbo.Employee
WHERE @EmployeeID = Id 


SELECT *
FROM dbo.fn_EmployeeDetails(2)



--multi statement table valued function 
CREATE FUNCTION dbo.fn_OrderDetails (@BusinessEntityID int, @CustomerID int)
RETURNS @ResultTable TABLE
(
   CustomerID int,
   BusinessEntityID int,
   ProductName nvarchar(50),
   Quantity int,
   TotalPrice decimal(13,5)
)
AS
BEGIN
          INSERT INTO @ResultTable(CustomerID, BusinessEntityID, ProductName, Quantity, TotalPrice)

		  SELECT o.CustomerId,o.BusinessEntityId,p.Name,od.Quantity,(od.Quantity*od.Price) as TotalPrice
		  FROM dbo.[Order] as o
		  INNER JOIN dbo.OrderDetails as od on o.id = od.OrderId
		  INNER JOIN dbo.Product p on p.id=od.ProductId
		  WHERE @BusinessEntityID = o.BusinessEntityId and @CustomerID = o.CustomerId
   
          RETURN
END


--call function

DECLARE @businessentityid int
SET @businessentityid = 1

DECLARE @customerid int
SET @customerid  = 4

SELECT *
FROM dbo.fn_OrderDetails(@businessentityid,@customerid)



		  