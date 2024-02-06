CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

EXEC TEST


CREATE PROCEDURE TEMP_Emp
AS
CREATE table #temp_emp(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)


Insert into #temp_emp
SELECT JobTitle, Count(JobTitle), Avg(Age),  AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics emp
JOIN [SQL Tutorial].dbo.EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_emp


EXEC TEMP_Emp @JobTitle = 'Salesman'