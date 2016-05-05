USE master
go

IF EXISTS (SELECT *	FROM sys.databases	WHERE NAME = 'Workers')
DROP DATABASE Workers
go

CREATE DATABASE Workers
go

USE Workers
go
-----------------------
CREATE TABLE tblUsers (
	userId INT PRIMARY KEY identity,
	username VARCHAR(20) NOT NULL,
	pwd VARCHAR(100) NOT NULL,
	roleId INT,
	uName NVARCHAR(50),
	dob DATE,
	tel VARCHAR(20),
	addr NVARCHAR(100),
	email VARCHAR(30),
	about VARCHAR(max),
	active BIT DEFAULT 1
	)

CREATE TABLE tblOrders (
	orderId INT PRIMARY KEY identity,
	userId INT FOREIGN KEY REFERENCES tblUsers(userId),
	orderDate DATETIME DEFAULT getdate(),
	active BIT DEFAULT 0
	)

CREATE TABLE tblCategories (
	categoryId INT PRIMARY KEY identity,
	cName NVARCHAR(50),
	active BIT DEFAULT 1
	)

CREATE TABLE tblJobs (
	jobId INT PRIMARY KEY identity,
	categoryId INT FOREIGN KEY REFERENCES tblCategories(categoryId),
	jName NVARCHAR(50),
	price FLOAT,
	active BIT DEFAULT 1
	)

CREATE TABLE tblOrderDetails (
	odId INT PRIMARY KEY identity,
	orderId INT FOREIGN KEY REFERENCES tblOrders(orderId),
	jobId INT FOREIGN KEY REFERENCES tblJobs(jobId),
	startDate DATE,
	endDate DATE,
	quantity INT,
	active BIT DEFAULT 0
	)

CREATE TABLE tblWorkers (
	workerId INT PRIMARY KEY identity,
	categoryId INT FOREIGN KEY REFERENCES tblCategories(categoryId),
	wName NVARCHAR(50),
	dob DATE,
	tel VARCHAR(20),
	addr NVARCHAR(100),
	email VARCHAR(30),
	about VARCHAR(max),
	active BIT DEFAULT 1
	)

CREATE TABLE tblWorkersInJobs (
	wijId INT PRIMARY KEY identity,
	jobId INT FOREIGN KEY REFERENCES tblJobs(jobId),
	workerId INT FOREIGN KEY REFERENCES tblWorkers(workerId),
	startDate DATE,
	endDate DATE,
	active BIT DEFAULT 1
	)
------------------------
create proc workersFreeTime
@cateID int,
@stDate date,
@endDate date
as
begin
select *
  from tblWorkers
      where not exists(
	  select 1
      from tblWorkersInJobs where workerId = tblWorkers.workerId and
         (@stDate between startDate and endDate   
          or @endDate between startDate and endDate
          or startDate between @stDate and @endDate)
		  ) and categoryId = @cateID and 
end
-----------------------
INSERT INTO tblUsers (username,pwd,roleId,uName)
VALUES  ('thien','96e79218965eb72c92a549dd5a330112',1,'Thiendmh'),--111111(pass)
		('hai','e3ceb5881a0a1fdaad01296d7554868d',2,'Hai'),--222222(pass)
		('tung','e3ceb5881a0a1fdaad01296d7554868d',2,'Tung')--222222(pass)

INSERT INTO tblCategories(cName,active)
VALUES					(N'Agricultural',1),
						(N'Computer ',1),
						(N'Director ',1),
						(N' Electrical',1),
						(N' Health',1)

INSERT INTO tblJobs(jName,categoryId,price)
VALUES				(N'Crop Farm Manager',1,1000),
					(N'Crop Worker',1,1000),
					(N'Equipment Operator',1,1000),
					(N'Product Grader Sorter',1,1000),
					(N'Operator',2,100),
					(N'Programmer',2,100),
					(N'Repairer',2,100),
					(N'Software Engineer',2,100),
					(N'Business Development',3,500),
					(N'Marketing',3,500),
					(N'Social Media',3,500),
					(N'Assistance Operator',3,500),
					(N'Parts Reconditioner ',4,200),
					(N'Power-Line Installer',4,200),
					(N'Sales Representative',4,200),
					(N'Drafter',4,200),	
					(N'Educator',5,800),
					(N'Practitioner',5,800),
					(N'Services Manager',5,800),
					(N'Specialties Teacher',5,800)

INSERT INTO tblWorkers(categoryId,wName,dob,tel,email,about,addr)
VALUES				  (1,N'Nancy','1968-12-08','0972341888','Nancy@gmail.com','aaaaa','addr'),
					  (1,N'Andrew','1952-02-19','0972341888','Andrew@gmail.com','aaaaa','addr'),
					  (1,N'Janet','1963-08-30','0972341888','Janet@gmail.com','aaaaa','addr'),
					  (1,N'Margaret','1958-09-19','0972341888','Margaret@gmail.com','aaaaa','addr'),
					  (2,N'Steven','1955-03-04','0972341888','Steven@gmail.com','aaaaa','addr'),
					  (2,N'Michael','1963-07-02','0972341888','Michael@gmail.com','aaaaa','addr'),
					  (2,N'Robert','1960-05-29','0972341888','Robert@gmail.com','aaaaa','addr'),
					  (3,N'Laura','1958-01-09','0972341888','Laura@gmail.com','aaaaa','addr'),
					  (3,N'Anne','1969-07-02','0972341888','Anne@gmail.com','aaaaa','addr'),
					  (3,N'Adam','1928-09-19','0972341888','Adam@gmail.com','aaaaa','addr'),
					  (4,N'Peter','09/09/1990','0972341888','Peter@gmail.com','aaaaa','addr'),
					  (4,N'Ronaldo','1955-03-04','0972341888','Ronaldo@gmail.com','aaaaa','addr'),
					  (4,N'Inesta','1958-06-19','0972341888','Inesta@gmail.com','aaaaa','addr'),
					  (5,N'Madona','1972-09-19','0972341888','Madona@gmail.com','aaaaa','addr'),
					  (5,N'Lionel','1969-01-02','0972341888','Lionel@gmail.com','aaaaa','addr'),
					  (5,N'Sophia','1942-05-29','0972341888','Sophia@gmail.com','aaaaa','addr'),
					  (5,N'Rob','1955-02-19','0972341888','Rob@gmail.com','aaaaa','addr')

INSERT INTO tblOrders(userId) VALUES(2)						
						
INSERT INTO tblOrderDetails(orderId,jobId,quantity,startDate,endDate) 
VALUES					   (1,2,5,'01/10/2016','01/20/2016'),
						   (1,4,5,'01/05/2016','01/15/2016'),
						   (1,3,5,'02/06/2016','02/12/2016'),	
						   (1,1,5,'03/25/2016','03/30/2016')								
