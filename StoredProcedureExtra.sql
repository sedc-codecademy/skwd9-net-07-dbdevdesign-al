
create function dbo.CalculateAge(@date datetime)
returns int
as
begin 
     declare @age int
	 select @age=year(getdate())-year(@date)
	 return @age

end


select dbo.CalculateAge ('1980-12-01')


create procedure dbo.EmployeeBirthday(@month int)
as
begin 

      create table #EmployeeGifts
	  (
	    ID int ,
		FirstName nvarchar(50),
		LastName nvarchar(50),
		Gender nvarchar(5),
		Age int,
		PresentSuggestion nvarchar(max)
	  )
      
	  insert into #EmployeeGifts(ID, FirstName,LastName,Gender,Age)
      select id, firstname,lastname, gender,dbo.CalculateAge(DateOfBirth) as age
	  from dbo.Employee
	  where month(dateofbirth) = @month
          
      update #EmployeeGifts
	  set PresentSuggestion = 
	      case when gender = 'M' and age between 35 and 40 then 'Football'
		       when gender = 'M' and age> 40 then 'Chess'
			   when Gender = 'M' and age <35 then 'Sports wear'
			   when gender = 'F' and age between 35 and 40 then 'Spa coupon'
			   when gender = 'F' and age> 40 then 'Handbag'
			   when gender = 'F' and age <35 then 'Perfume'
			   else 'Book' end

      select FirstName, LastName, PresentSuggestion
	  from #EmployeeGifts

	  drop table #EmployeeGifts
end


exec dbo.EmployeeBirthday '8'