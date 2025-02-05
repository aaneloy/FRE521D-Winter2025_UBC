-- Ensure we are using the correct database
USE FRE521D;
GO

-- 1️⃣ Filtering and Conditions
-- Select employees from department 90
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;
GO

-- Select employees with last name 'WHALEN'
SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'WHALEN';
GO

-- Select employees with salary less than or equal to 3000
SELECT last_name, salary
FROM employees
WHERE salary <= 3000;
GO

-- Select employees with salary between 2500 and 3500
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;
GO

-- Select employees whose manager_id is 100, 101, or 201
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);
GO

-- 2️⃣ Sorting Results
-- Order employees by hire_date in descending order
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;
GO

-- Order employees by department_id, then salary in descending order
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;
GO

-- 3️⃣ Removing Duplicates
-- Get unique job titles
SELECT DISTINCT job_title FROM jobs;
GO

-- 4️⃣ String Operations
-- Concatenate last_name with job_id (Employee and Title)
SELECT last_name + ', ' + job_id AS "Employee and Title"
FROM employees;
GO

-- 5️⃣ Aggregation
-- Count the number of employees per department
SELECT department_id, COUNT(*) AS EmployeeCount
FROM employees
GROUP BY department_id;
GO

-- Find the total salary per department
SELECT department_id, SUM(salary) AS TotalSalary
FROM employees
GROUP BY department_id;
GO

-- Find the maximum and minimum salary in each department
SELECT department_id, MAX(salary) AS MaxSalary, MIN(salary) AS MinSalary
FROM employees
GROUP BY department_id;
GO

-- Find average salary per department
SELECT department_id, AVG(salary) AS AvgSalary
FROM employees
GROUP BY department_id;
GO

-- Use HAVING to filter groups
SELECT department_id, COUNT(*) AS EmployeeCount
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;
GO

-- 6️⃣ Subqueries
-- Find employees with a salary greater than Abel’s
SELECT last_name
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Abel');
GO

-- Find employees whose salary is less than any IT_PROG salary
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';
GO

-- Find employees whose salary is greater than all ST_CLERK salaries
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE job_id = 'ST_CLERK')
AND job_id <> 'ST_CLERK';
GO

-- 7️⃣ Joins
-- Inner Join: Get employees with their department names
SELECT e.employee_id, e.last_name, e.job_id, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;
GO

-- Left Join: Show all employees with their department names (including those without a department)
SELECT e.employee_id, e.last_name, e.job_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
GO

-- Right Join: Show all departments with employees (including departments without employees)
SELECT e.employee_id, e.last_name, e.job_id, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;
GO

-- Full Join: Show all employees and all departments, even if there is no match
SELECT e.employee_id, e.last_name, e.job_id, d.department_name
FROM employees e
FULL JOIN departments d ON e.department_id = d.department_id;
GO

-- Self Join: Show employees and their managers
SELECT e1.employee_id, e1.last_name AS Employee, e2.last_name AS Manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;
GO

-- 8️⃣ Constraints
-- Add Primary Key Constraints
ALTER TABLE employees ADD CONSTRAINT PK_Employees_Employee_Id PRIMARY KEY (Employee_Id);
ALTER TABLE departments ADD CONSTRAINT PK_departments_Department_id PRIMARY KEY (Department_id);
ALTER TABLE jobs ADD CONSTRAINT PK_Jobs PRIMARY KEY (job_id);
ALTER TABLE locations ADD CONSTRAINT PK_Locations PRIMARY KEY (Location_id);
GO

-- Add Foreign Key Constraints
ALTER TABLE employees ADD CONSTRAINT FK_Employees_Manager FOREIGN KEY (Manager_id) REFERENCES employees(Employee_Id);
ALTER TABLE employees ADD CONSTRAINT FK_Employees_Department FOREIGN KEY (Department_Id) REFERENCES departments(Department_id);
ALTER TABLE employees ADD CONSTRAINT FK_Employees_Job FOREIGN KEY (Job_Id) REFERENCES jobs(job_id);
ALTER TABLE departments ADD CONSTRAINT FK_Departments_Location FOREIGN KEY (Location_id) REFERENCES locations(Location_id);
GO

-- 9️⃣ Data Manipulation (DML)
-- Insert a new employee
INSERT INTO employees (employee_id, first_name, last_name, job_id, salary)
VALUES (1001, 'John', 'Doe', 'SALES_REP', 50000);
GO

-- Insert multiple employees
INSERT INTO employees (employee_id, first_name, last_name, job_id, salary)
VALUES (1002, 'Jane', 'Smith', 'HR_REP', 45000), 
       (1003, 'Mike', 'Johnson', 'IT_PROG', 60000);
GO

-- Update an employee's salary
UPDATE employees
SET salary = 55000
WHERE employee_id = 1001;
GO

-- Increase salary by 10% for all sales representatives
UPDATE employees
SET salary = salary * 1.1
WHERE job_id = 'SALES_REP';
GO

-- Delete employees with salary below 30000
DELETE FROM employees
WHERE salary < 30000;
GO

-- Delete employees who were hired before 2008
DELETE FROM employees
WHERE employee_id IN (SELECT employee_id FROM employees WHERE hire_date < '2008-01-01');
GO

--  🔟 Miscellaneous
-- Copy the Employees table
SELECT * INTO employees_copy FROM employees;
GO

-- Delete employees with low salary from the copied table
DELETE FROM employees_copy WHERE salary < 30000;
GO

-- Drop a table if it exists
DROP TABLE IF EXISTS employees_copy;
GO

