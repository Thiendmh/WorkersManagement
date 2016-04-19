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
	about TEXT,
	active BIT DEFAULT 1
	)

CREATE TABLE tblOrders (
	orderId INT PRIMARY KEY identity,
	userId INT FOREIGN KEY REFERENCES tblUsers(userId),
	orderDate DATETIME DEFAULT getdate(),
	active BIT DEFAULT 1
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
	active BIT DEFAULT 1
	)

CREATE TABLE tblWorkers (
	workerId INT PRIMARY KEY identity,
	categoryId INT FOREIGN KEY REFERENCES tblCategories(categoryId),
	wName NVARCHAR(50),
	dob DATE,
	tel VARCHAR(20),
	addr NVARCHAR(100),
	email VARCHAR(30),
	about TEXT,
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

-----------------------
INSERT INTO tblUsers (username,pwd,roleId,uName)
VALUES  ('thien','111111',1,'Thiendmh'),
		('hai','222222',2,'Hai'),
		('tung','222222',2,'Tung')

INSERT INTO tblCategories(cName,active)
VALUES					('Y tế',1),
						('Giáo dục',1),
						('Nông nghiệp',1),
						('Giao thông',1),
						('Kinh tế',1)

INSERT INTO tblJobs(jName,categoryId,price)
VALUES				('Bác sĩ đa khoa',1,1000),
					('Bác sĩ chuyên khoa',1,1000),
					('Bác sĩ ngoại khoa',1,1000),
					('Bác sĩ sản phụ khoa',1,1000),
					('Giáo viên cấp 1',2,100),
					('Giáo viên cấp 2',2,100),
					('Giáo viên cấp 3',2,100),
					('Giáo viên đại học',2,100),
					('Trồng rau',3,500),
					('Trồng ngô',3,500),
					('Trồng khoai',3,500),
					('Trồng sắn',3,500),
					('Thi công đường',4,200),
					('Thi công cống',4,200),
					('Thi công cầu',4,200),
					('Thi công hầm',4,200),	
					('Kinh doanh BĐS',5,800),
					('Kinh doanh đa cấp',5,800),
					('Kinh doanh phụ kiện',5,800),
					('Kinh doanh ô tô',5,800)

INSERT INTO tblWorkers(categoryId,wName,dob,tel,email,about,addr)
VALUES				  (1,'Nguyễn văn A','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (1,'Nguyễn văn B','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (1,'Nguyễn văn C','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (1,'Nguyễn văn D','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (2,'Nguyễn văn E','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (2,'Nguyễn văn F','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (2,'Nguyễn văn G','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (3,'Nguyễn văn H','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (3,'Nguyễn văn I','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (3,'Nguyễn văn K','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (4,'Nguyễn văn L','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (4,'Nguyễn văn M','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (4,'Nguyễn văn N','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (5,'Nguyễn văn O','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (5,'Nguyễn văn P','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (5,'Nguyễn văn P','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr'),
					  (5,'Nguyễn văn P','09/09/1990','0972341888','nguyenvana@gmail.com','aaaaa','addr')
						
						
