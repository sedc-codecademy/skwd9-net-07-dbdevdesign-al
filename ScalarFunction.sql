--create objects
CREATE FUNCTION dbo.fn_ProductNameDetails (@ProductID int)
RETURNS nvarchar(100)
AS 
BEGIN
 
        DECLARE @Result NVARCHAR(100)
        SELECT @Result = LEFT(Code,3) + ' - ' + SUBSTRING(Name,1,5)+ ' - '+ CAST(Price AS nvarchar(50))
		FROM dbo.Product
		WHERE @ProductID = ID
        RETURN @Result

END

--call function
select dbo.fn_ProductNameDetails(5) as ProductName
