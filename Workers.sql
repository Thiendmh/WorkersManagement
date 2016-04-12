USE master

IF EXISTS (
		SELECT *
		FROM sys.databases
		WHERE NAME = 'Workers'
		)
	DROP DATABASE Workers

CREATE DATABASE Workers

USE Workers

-----------------------
CREATE TABLE tblUsers (
	userId VARCHAR(10) PRIMARY KEY,
	username VARCHAR(20) NOT NULL,
	pwd TEXT NOT NULL,
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
	orderId VARCHAR(10) PRIMARY KEY,
	userId VARCHAR(10) FOREIGN KEY REFERENCES tblUsers(userId),
	orderDate DATETIME DEFAULT getdate(),
	active BIT DEFAULT 1
	)

CREATE TABLE tblCategories (
	categoryId VARCHAR(10) PRIMARY KEY,
	cName NVARCHAR(50),
	active BIT DEFAULT 1
	)

CREATE TABLE tblJobs (
	jobId VARCHAR(10) PRIMARY KEY,
	categoryId VARCHAR(10) FOREIGN KEY REFERENCES tblCategories(categoryId),
	jName NVARCHAR(50),
	price FLOAT,
	active BIT DEFAULT 1
	)

CREATE TABLE tblOrderDetails (
	odId VARCHAR(10) PRIMARY KEY,
	orderId VARCHAR(10) FOREIGN KEY REFERENCES tblOrders(orderId),
	jobId VARCHAR(10) FOREIGN KEY REFERENCES tblJobs(jobId),
	startDate DATE,
	endDate DATE,
	quantity INT,
	active BIT DEFAULT 1
	)

CREATE TABLE tblWorkers (
	workerId VARCHAR(10) PRIMARY KEY,
	wName NVARCHAR(50),
	dob DATE,
	tel VARCHAR(20),
	addr NVARCHAR(100),
	email VARCHAR(30),
	about TEXT,
	active BIT DEFAULT 1
	)

CREATE TABLE tblWorkersInJobs (
	wijId VARCHAR(10) PRIMARY KEY,
	jobId VARCHAR(10) FOREIGN KEY REFERENCES tblJobs(jobId),
	workerId VARCHAR(10) FOREIGN KEY REFERENCES tblWorkers(workerId),
	startDate DATE,
	endDate DATE,
	active BIT DEFAULT 1
	)
	-----------------------

