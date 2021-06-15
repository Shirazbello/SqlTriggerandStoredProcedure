USE DenemeTable
Go
--Creating a Table 
Create Table People
(
id int Primary key(id) identity(1,1),
Firstname varchar(50) NOT NULL,
LastName varchar(50) NOT NULL
)
Go
--Inserting into the table
Insert into People(Firstname,Lastname) 
Values
('Shiraz','Bello'),
('Fred', 'Smith'),
('John', 'Smith'),
('Michael', 'Smith'),
('Robert', 'Smith'),
('Dad','Shiraz'),
('Lukman','Bello'),
('Gariba','Bello');
Go

--Creating a Stored Procedure for the Table
create Procedure dbo.spPeopleGetAll
as
begin
  Select Firstname, Lastname from dbo.People
end

Go

--Executing Stored Procedure
exec dbo.spPeopleGetAll
Go

--Altering Stored Procedure to not get Count Message
Alter Procedure dbo.spPeopleGetAll
as
begin
  set nocount on;
  Select id, Firstname, Lastname from dbo.People
end

Go
--No More Rows Affected Count Message
exec dbo.spPeopleGetAll

Go

--Stored Procedure By Using LastName
Create procedure dbo.spPeopleGet_ByLastName
@Lastname nvarchar(50)
as
begin
  set nocount on;
  select id,Lastname,Firstname 
  from dbo.People where LastName=@Lastname
end

--Executing LastName Stored Procedure
exec dbo.spPeopleGet_ByLastName 'Shiraz'

Go

--Altering procedure
Alter procedure dbo.spPeopleGet_ByLastName
@FirstName nvarchar(50),
@Lastname nvarchar(50)
as
begin
  set nocount on;
  select id,Firstname,Lastname 
  from dbo.People where Firstname=@Firstname and LastName=@Lastname  
end

--QUERYING it
exec dbo.spPeopleGet_ByLastName 'Shiraz','Bello'

--ROLE CREATION IN DATABASE (Security>>Role)
Create Role dbStoredProcedureOnlyAccess
--Granting Role access
Grant execute to dbStoredProcedureOnlyAccess