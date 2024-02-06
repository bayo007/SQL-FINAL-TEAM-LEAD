CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

EXEC TEST


CREATE PROCEDURE Temp_Employee
AS
Create table #temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT into #temp_employee
SELECT JobTitle, COUNT(JobTitle), Avg(Age) ,AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle


SELECT *
FROM #temp_employee

EXEC Temp_Eemployee