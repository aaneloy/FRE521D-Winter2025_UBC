-- Create the database
CREATE DATABASE FRE521D;
GO

-- Use the database
USE FRE521D;
GO

-- Create Jobs Table
CREATE TABLE Jobs (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(35),
    min_salary INT,
    max_salary INT
);
GO

-- Insert Data into Jobs
INSERT INTO Jobs VALUES ('AD_PRES', 'President', 20000, 40000);
INSERT INTO Jobs VALUES ('AD_VP', 'Administration Vice President', 15000, 30000);
INSERT INTO Jobs VALUES ('AD_ASST', 'Administration Assistant', 3000, 6000);
INSERT INTO Jobs VALUES ('AC_MGR', 'Account Manager', 8200, 16000);
INSERT INTO Jobs VALUES ('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
INSERT INTO Jobs VALUES ('SA_MAN', 'Sales Manager', 10000, 20000);
INSERT INTO Jobs VALUES ('SA_REP', 'Sales Representative', 6000, 12000);
INSERT INTO Jobs VALUES ('ST_MAN', 'Stock Manager', 5500, 8500);
INSERT INTO Jobs VALUES ('ST_CLERK', 'Stock Clerk', 2000, 5000);
INSERT INTO Jobs VALUES ('IT_PROG', 'Programmer', 4000, 10000);
INSERT INTO Jobs VALUES ('MK_MAN', 'Marketing Manager', 9000, 15000);
INSERT INTO Jobs VALUES ('MK_REP', 'Marketing Representative', 4000, 9000);
GO

-- Create Employees Table
CREATE TABLE Employees (
    Employee_Id INT PRIMARY KEY,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(25) NOT NULL,
    Email VARCHAR(25) NOT NULL,
    Phone_Number VARCHAR(15),
    Hire_Date DATE NOT NULL,
    Job_Id VARCHAR(10) NOT NULL,
    Salary DECIMAL(8,2),
    Commission_pct DECIMAL(2,2),
    Manager_id INT,
    Department_Id INT
);
GO

-- Insert Data into Employees
INSERT INTO Employees VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', '2006-06-17', 'AD_PRES', 24000, NULL, NULL, 90);
INSERT INTO Employees VALUES (101, 'Neena', 'Kochar', 'NKOCHAR', '515.123.4568', '2008-09-21', 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO Employees VALUES (102, 'Lex', 'De Haan', 'DEHAAN', '515.123.4569', '2009-01-13', 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO Employees VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2008-01-03', 'IT_PROG', 9000, NULL, 102, 60);
INSERT INTO Employees VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2009-05-21', 'IT_PROG', 6000, NULL, 103, 60);
INSERT INTO Employees VALUES (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '2008-02-07', 'IT_PROG', 4200, NULL, 103, 60);
INSERT INTO Employees VALUES (124, 'Kevin', 'Mourgos', 'KMORGOS', '650.123.5234', '2012-11-16', 'ST_MAN', 5800, NULL, 100, 50);
INSERT INTO Employees VALUES (141, 'Treena', 'Rajs', 'RRAJS', '650.121.5234', '2004-10-17', 'ST_CLERK', 3500, NULL, 124, 50);
INSERT INTO Employees VALUES (142, 'Curtis', 'Davies', 'CDAVIES', '121.123.5234', '2007-01-29', 'ST_CLERK', 3100, NULL, 124, 50);
INSERT INTO Employees VALUES (143, 'Randall', 'Matos', 'RMATOS', '121.123.5234', '2008-03-15', 'ST_CLERK', 2600, NULL, 124, 50);
INSERT INTO Employees VALUES (144, 'Peter', 'Vargas', 'PVARGAS', '121.123.5234', '2008-07-09', 'ST_CLERK', 2500, NULL, 124, 50);
INSERT INTO Employees VALUES (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '44.1344.429018', '2014-01-29', 'SA_MAN', 10500, 0.2, 100, 80);
GO

-- Create Departments Table
CREATE TABLE Departments (
    Department_id INT PRIMARY KEY,
    Department_Name VARCHAR(30) NOT NULL,
    Manager_id INT,
    Location_id INT
);
GO

-- Insert Data into Departments
INSERT INTO Departments VALUES (10, 'Administration', 200, 1700);
INSERT INTO Departments VALUES (20, 'Marketing', 201, 1800);
INSERT INTO Departments VALUES (50, 'Shipping', 124, 1500);
INSERT INTO Departments VALUES (60, 'IT', 103, 1400);
INSERT INTO Departments VALUES (80, 'Sales', 149, 2500);
INSERT INTO Departments VALUES (90, 'Executive', 100, 1700);
INSERT INTO Departments VALUES (110, 'Accounting', 205, 1700);
INSERT INTO Departments VALUES (190, 'Contracting', NULL, 1700);
GO

-- Create Locations Table
CREATE TABLE Locations (
    Location_id INT PRIMARY KEY,
    Street_Address VARCHAR(40),
    Postal_Code VARCHAR(12),
    City VARCHAR(30) NOT NULL,
    State_Province VARCHAR(25),
    Country_ID CHAR(2)
);
GO

-- Insert Data into Locations
INSERT INTO Locations VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO Locations VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO Locations VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO Locations VALUES (1800, '460 Bloor St. W.', 'ON M5S 1X8', 'Toronto', 'Ontario', 'CA');
INSERT INTO Locations VALUES (2500, 'Magdalen Centre- The Oxford Sc. Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
GO

-- Verify Data
SELECT * FROM Jobs;
SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Locations;
GO
