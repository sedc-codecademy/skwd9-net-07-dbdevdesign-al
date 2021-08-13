DECLARE @age INT
SET @age = 10

SELECT @age
PRINT @age


CREATE TABLE #Products
(
   Name nvarchar(50),
   Code nvarchar(100),
   Createddate datetime,
   Createdby nvarchar(50)
)


SELECT *
INTO ##Products
FROM #Products

select * from ##Products

INSERT INTO #Products(Name,Code,Createddate,Createdby)
SELECT Name,Code,getdate(),'Dana Tasevska' 
FROM dbo.Product

drop table #Products
drop table ##Products

DECLARE @Product table
(
   Name nvarchar(50),
   Code nvarchar(100),
   Createddate datetime,
   Createdby nvarchar(50)
)

select * 
from @Product
