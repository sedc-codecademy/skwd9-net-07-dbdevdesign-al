CREATE DATABASE SEDC2
GO

USE SEDC2
GO

CREATE TABLE dbo.Customer
(
    ID int not null,
	FirstName nvarchar(20) not null,
	LastName nvarchar(20) not null,
	Email nvarchar(50) null
)

INSERT INTO dbo.Customer(ID, FirstName,LastName)
VALUES(1,'Dana','Tasevska')

INSERT INTO dbo.Customer(ID, FirstName,LastName, Email)
VALUES(2,'Nikola','Petkovski','nperkovski@gmail.com')

INSERT INTO dbo.Customer(ID, FirstName, LastName,Email)
VALUES(3,'Marija','Trajkovska','mm@yahoo.com')

SELECT FirstName,LastName
FROM dbo.Customer
WHERE FirstName = 'Dana'

SELECT *
FROM dbo.Customer

DROP TABLE dbo.Customer


CREATE TABLE dbo.Customer
(
    ID int IDENTITY(1,1) not null,
	FirstName nvarchar(20) not null,
	LastName nvarchar(20) not null,
	Email nvarchar(50) null,
	 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
)

INSERT INTO dbo.Customer(FirstName,LastName)
VALUES('Dana','Tasevska')

INSERT INTO dbo.Customer(FirstName,LastName, Email)
VALUES('Nikola','Petkovski','nperkovski@gmail.com')

INSERT INTO dbo.Customer(FirstName, LastName,Email)
VALUES('Marija','Trajkovska','mm@yahoo.com')

SELECT *
FROM dbo.Customer
WHERE ID = 2

UPDATE dbo.Customer
SET FirstName = 'Trajce'
WHERE id = 2
