USE [SQL Tutorial]
GO
/****** Object:  StoredProcedure [dbo].[TEMP_Emp]    Script Date: 25/01/2024 03:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[TEMP_Emp]
@JobTitle nvarchar(100)
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
Where JobTitle = @JobTitle
GROUP BY JobTitle

SELECT *
FROM #temp_emp




SELECT *
FROM EmployeeSalary

SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS ALLAVG
FROM EmployeeSalary


SELECT EmployeeID, Salary, AVG(Salary) OVER () AS ALLAVGSALARY
FROM EmployeeSalary


SELECT a.EmployeeID, ALLAVGSALARY
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER () AS ALLAVGSALARY
	FROM EmployeeSalary) a

SELECT EmployeeID,JobTitle,Salary
FROM EmployeeSalary
WHERE EmployeeID in (
	SELECT EmployeeID
	FROM EmployeeDemographics
	WHERE Age > 30
)