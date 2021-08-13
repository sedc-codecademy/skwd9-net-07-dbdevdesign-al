--create stored procedure
ALTER PROCEDURE dbo.InsertNewOrder (@businessentityid int, @customerid int, @employeeid int, @orderdate datetime)
AS

BEGIN
           print 'Pocetok'

		   BEGIN TRY

		   BEGIN TRAN

		   INSERT INTO dbo.[Order](BusinessEntityId,CustomerId,EmployeeId,OrderDate)
		   VALUES(@businessentityid,@customerid,@employeeid,@orderdate)

		   COMMIT

		   PRINT 'Uspeshno'

		   END TRY

		   BEGIN CATCH

		             ROLLBACK 

		             SELECT ERROR_MESSAGE() AS ERRORMESSAGE,
					        ERROR_LINE() AS ERRORLINE,
							ERROR_PROCEDURE() AS ERRORPROCEDURE,
							ERROR_NUMBER() AS ERRORNUMBER,
							ERROR_STATE() AS ERRORSTATE,
							ERROR_SEVERITY() AS ERRORSEVERITY

                      PRINT 'Neupsehno'

		   END CATCH


		   SELECT COUNT(*) as OrderCount
		   FROM dbo.[Order]
		   WHERE @customerid = CustomerId
	
	       SELECT sum(totalprice) as SumTotalPrice
		   FROM dbo.[Order]
		   WHERE @customerid = CustomerId and @businessentityid = BusinessEntityId

		   print 'Kraj'
END
GO

--call procedure

declare @businessentityid int
set @businessentityid = 100
declare @customerid int
set @customerid = 5
declare @employeeid int
set @employeeid = 1
declare @orderdate datetime
set @orderdate = '2021-08-15'

exec dbo.InsertNewOrder @businessentityid,@customerid,@employeeid,@orderdate

select *
from dbo.[Order]
order by id desc

select *
from dbo.[Order]
where BusinessEntityID = 1
and CustomerId = 4
and EmployeeId = 1 and OrderDate = '2021-08-15'

















