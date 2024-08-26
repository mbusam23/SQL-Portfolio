create database alex_the_analysy
use alex_the_analysy

/*	create table employeeDemographics(
		EmployeeID		int,
		Firstname		varchar(50),
		Lastname		varchar(50),
		Age				int,
		Gender			varchar(50)
						)*/	
/*
CREATE TABLE EmployeeSalary(
	EmployeeID	int,
	JobTitle	varchar(50),
	Salary		int 	  )
	*/
/*	SELECT TOP N ROWS COMMAND FROM SSMS				*/
SELECT TOP(1000) Firstname, Lastname FROM employeeDemographics
SELECT TOP(1000) * FROM employeeDemographics

/*	INSERTING VALUES	*/
INSERT INTO employeeDemographics VALUES
	(1001,'Jim','Halpert',30,'Male'),
	(1002,'Pam','Beaslay',30,'Female'),
	(1003,'Dwigth','Schrute',29,'Male'),
	(1004,'Angela','Martin',31,'Female'),
	(1005,'Toby','Flenderson',32,'Male'),
	(1006,'Michael','Scott',35,'Male'),
	(1007,'Meredith','Palmer',32,'Female'),
	(1008,'Stanley','Hudson',38,'Male'),
	(1009,'Kevin','Malone',31,'Male')

select * from EmployeeSalary

INSERT INTO EmployeeSalary VALUES
	(1001,'Salesman'	,45000),
	(1002,'Recepcionist',36000),
	(1003,'Salesman'	,63000),
	(1004,'Accountant'	,47000),
	(1005,'HR'			,50000),
	(1006,'Regional Manager'	,65000),
	(1007,'Supplier Relations'	,41000),
	(1008,'Salesman'			,48000),
	(1009,'Accountant'			,42000)

	/* 	SELECT STATEMENT 
	*,TOP,DISTINCT, COUNT,AS,MAX,MIN,AVG,SUM
	*/
	SELECT * FROM alex_the_analysy.dbo.employeeDemographics --EN CADA PUNTO SQL te da info
	SELECT * FROM employeeDemographics
	--TOP,DISTINCT, COUNT,AS
	SELECT TOP 5 * FROM employeeDemographics
	SELECT DISTINCT * FROM employeeDemographics
	SELECT COUNT(Age) FROM employeeDemographics --Si es rosado, necesita un argumento
	SELECT Age AS EDAD FROM employeeDemographics
	--Agregation functions
	SELECT SUM(Age)	 FROM employeeDemographics
	SELECT MAX(Age)  FROM employeeDemographics
	SELECT MIN(Age)  FROM employeeDemographics
	SELECT AVG(Age)  FROM employeeDemographics
	--FROM
	SELECT Age FROM employeeDemographics
	--WHERE
	SELECT Age FROM employeeDemographics WHERE Gender='Female'
	SELECT Age FROM employeeDemographics WHERE Age<31
	SELECT Age FROM employeeDemographics WHERE Age<31 AND Gender='Female'
	SELECT Age FROM employeeDemographics WHERE Age<31 OR Gender='Female'
	--ORDER BY
	SELECT Age FROM employeeDemographics ORDER BY Firstname
	SELECT Age FROM employeeDemographics ORDER BY Age DESC
	--group by (COMPUESTO) Doble columna
	SELECT Gender, count(age) FROM	employeeDemographics
	GROUP BY Gender
	--SUBQUERYS
	SELECT firstname,lastname FROM employeeDemographics
	WHERE EmployeeID IN (
		SELECT EmployeeID FROM EmployeeSalary
		WHERE Salary>(SELECT AVG(Salary) FROM EmployeeSalary)
						)
		/*WHERE STATEMENT
		=,<>,>,<,AND,OR,LIKE,NULL,NOT NULL, IN	*/

		SELECT * FROM employeeDemographics WHERE Age<=32
		SELECT * FROM employeeDemographics WHERE Age<=32 OR GENDER='Male'
		SELECT * FROM employeeDemographics WHERE Age<>30
		SELECT * FROM employeeDemographics WHERE Firstname LIKE 'Dw%'
		SELECT * FROM employeeDemographics WHERE Firstname IS NOT NULL
		SELECT * FROM employeeDemographics WHERE Firstname IS NULL
		SELECT * FROM employeeDemographics WHERE Age IN (30,31,32)

		/*GROUP BY VS ORDER BY
		*/
		SELECT DISTINCT gender,COUNT(gender) FROM employeeDemographics
		GROUP BY Gender
		ORDER BY COUNT(Gender) desc

		SELECT * FROM employeeDemographics 
		ORDER BY Age DESC,Gender ASC

/*
Intermediate SQL
*/
	/*
	CREATE TABLE Warehouseemployeesdemographics(
			EmployeeID	varchar(50),
			FirstName	varchar(50),
			Lastname	varchar(50),
			Age			int,
			Gender			varchar(50)			)
	INSERT INTO Warehouseemployeesdemographics VALUES
			('1011','Ryan','Howard',26,'Male'),
			(NULL,'Holly','Flax',NULL,NULL),
			('1013','Darryl','Philbin',NULL,'Male')
	*/
	SELECT* FROM [dbo].[Warehouseemployeesdemographics]
		CREATE TABLE #Tem_Employee2(
			JobTitle		varchar(50),
			EmployeesPerJob	int,
			Avgage			int,
			Avgsalary		int)
			/*
		INSERT INTO #Tem_Employee2
			SELECT JobTitle, COUNT(JobTitle),AVG(Age),AVG(Salary)
			FROM employeeDemographics		  emp
				 JOIN EmployeeSalary		  sal
				 ON	emp.EmployeeID= sal.EmployeeID
			GROUP BY JobTitle */
/*
JOINS - Combina muchas tablas en una sola
*/
	select * from employeeDemographics
	JOIN EmployeeSalary	--INNER JOIN (A∩B), LEFT JOIN(SOLO A), RIGHT JOIN (SOLO B), FULL JOIN (AUB)
	ON EmployeeSalary.EmployeeID= employeeDemographics.EmployeeID

	SELECT * FROM EmployeeSalary
	LEFT OUTER JOIN #Tem_Employee2
	ON EmployeeSalary.JobTitle = #Tem_Employee2.JobTitle

	SELECT * FROM EmployeeSalary
	right OUTER JOIN #Tem_Employee2
	ON EmployeeSalary.JobTitle = #Tem_Employee2.JobTitle

	SELECT * FROM EmployeeSalary
	FULL OUTER JOIN #Tem_Employee2
	ON EmployeeSalary.JobTitle = #Tem_Employee2.JobTitle

	SELECT * FROM Warehouseemployeesdemographics
	FULL OUTER JOIN Employeesalary
	ON Warehouseemployeesdemographics.EmployeeID = Employeesalary.EmployeeID

	SELECT * FROM Warehouseemployeesdemographics
	LEFT OUTER JOIN Employeesalary
	ON Warehouseemployeesdemographics.EmployeeID = Employeesalary.EmployeeID

/*
UNIONS (TIENE QUE ser tablas del mismo n de columnas sino nica)
*/
	SELECT * FROM [dbo].[employeeDemographics]
	UNION
	SELECT * FROM [dbo].[Warehouseemployeesdemographics]
	--Aca un ejemploi de como se combina
	SELECT EmployeeID,firstname,age FROM employeeDemographics
	UNION
	SELECT EmployeeID, Jobtitle,salary FROM EmployeeSalary

/*
CASE STATEMENTS
*/
--1
	SELECT Firstname,Lastname,Age,
	CASE 
		WHEN Age >30 THEN 'OLD'
		WHEN Age BETWEEN 27 AND 30 THEN 'Young'
		ELSE 'BABY' 
		END
	FROM  employeedemographics
	WHERE Age is NOT NULL
	ORDER BY Age
--2
	SELECT firstname,lastname,jobtitle, salary,
		CASE
			WHEN jobtitle='Salesman' THEN Salary+ (Salary*0.1)
			WHEN jobtitle='Accountant' THEN Salary+ (Salary*0.05)
			WHEN jobtitle='HR' THEN Salary+ (Salary*0.0000001)
			ELSE Salary+ (Salary*0.03)
		END AS  Net_Salary
	FROM employeeDemographics
	JOIN EmployeeSalary
	ON employeeDemographics.EmployeeID =EmployeeSalary.EmployeeID

/*
HAVING CLOUSE
*/
--1
	SELECT Jobtitle, count(Jobtitle) FROM EmployeeSalary
	GROUP BY Jobtitle
	HAVING COUNT(Jobtitle)>1 --Have va despues de GROUP BY - 

--2
	SELECT Jobtitle, AVG(Salary) FROM EmployeeSalary
	GROUP BY Jobtitle
	HAVING AVG(Salary)>45000
	ORDER BY AVG(Salary)

/*
UPDATE & DELETE DATA
*/
--1
	UPDATE Warehouseemployeesdemographics
	SET EmployeeID=1012 , Gender='Female' WHERE firstname='Holly'
--2
	UPDATE Warehouseemployeesdemographics
	SET Age=33 WHERE FirstName like 'H%'
--3
	UPDATE Warehouseemployeesdemographics
	SET Age=35 WHERE FirstName like 'Da%'
--4 
	DELETE FROM employeeDemographics
	WHERE EmployeeID=1001
--5  verificar que borras siempres
	SELECT *
	FROM Warehouseemployeesdemographics
	WHERE FirstName like 'H%'

/*
ALIASING
*/
--1
	SELECT a.EmployeeID, a.firstname, a.lastname, b.salary, c.Age
	FROM employeeDemographics a
	LEFT JOIN EmployeeSalary b
	ON a.EmployeeID = b.EmployeeID
	LEFT JOIN Warehouseemployeesdemographics C
	ON a.EmployeeID = c.EmployeeID

/*
PARTISION BY
*/
--1
	SELECT dem.Firstname, dem.lastname, dem.Gender, sal.Salary, 
	COUNT(GENDER) OVER (PARTITION BY Gender) as TotalGender
	FROM employeeDemographics dem
	JOIN EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID

	SELECT Gender,
	COUNT(GENDER) 
	FROM employeeDemographics dem
	JOIN EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
	GROUP BY Gender
/*
CTE (Common Table Expression)
*/
--1
	WITH  CTE_employee AS
		(SELECT Firstname,lastname, Gender, Salary, 
		 COUNT(gender)	OVER (PARTITION BY Gender ) AS TotalGender,
		 AVG  (Salary)	OVER (PARTITION BY Gender) AS AVGSalary
		 FROM employeeDemographics emp
		 JOIN EmployeeSalary sal
		 ON emp.EmployeeID = sal.EmployeeID
		 WHERE Salary >'45000'
		)
	SELECT Firstname, AVGSalary
	FROM CTE_employee

---aADVANCED

/*
TEMP TABLES
*/
--1
	CREATE TABLE #temp_employee(
		EmployeeID		  int,
		Jobtitle varchar(100),
		Salary			  int)

	INSERT INTO #temp_employee VALUES
	(1001, 'HR',450200)

	INSERT INTO #temp_employee  
	SELECT * FROM EmployeeSalary
--2
		CREATE TABLE #temp_employee2(
			Jobtitle varchar(100),
			Employeeperjob	  int,
			Avgage			  int,
			Avgsalary		  int)

		INSERT INTO #temp_employee2
		SELECT Jobtitle, COUNT(Jobtitle), AVG(Age),AVG(Salary)
		FROM employeeDemographics
		JOIN EmployeeSalary
		ON employeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
		GROUP BY Jobtitle
--3
		DROP TABLE IF EXISTS #temp_employee2
/*
string function -TRIM, LTRIM,RTRIM,REPLACE, SUBSTRING,UPPER,LOWER
*/LL

/*
CREATE TABLE EmployeeErrors(
			EmployeeID	varchar(50),
			Firstname	varchar(50),
			Lastname	varchar(50)
							)
INSERT INTO EmployeeErrors VALUES
		('   1001','  Jimbo','Halbert'),
		('1002  ', 'Pamela','Beasley'),
		('1005 ',  ' Toby','Flenderson - Fired')
		*/
	--using TRIM,LTRIM,RTRIM
	SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM FROM EmployeeErrors --Quita espacios vacios
	SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM FROM EmployeeErrors --Quita espacios vacios
	SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM FROM EmployeeErrors --Quita espacios vacios

/*
USING REPLACE
*/
	SELECT Lastname, TRIM(REPLACE(Lastname,' - Fired','')) as lastnamefisex
	FROM EmployeeErrors
	select * from EmployeeErrors

/*
using SUBSTRING
*/
	SELECT SUBSTRING(Firstname,2,3) as TRE_letras --substring(Col,inicia, cuantas palabras?)
	FROM EmployeeErrors

/*
STORED PROCEDURES
*/
CREATE PROCEDURE TEST AS 
	SELECT * from employeeDemographics
	EXEC TEST --llama al procedimiento
	--creando parametors / PRocedimeint ocn un parametro especifico

create PROCEDURE Temp_Employee @JobTitle nvarchar(100) AS
		CREATE TABLE #temp_employee(
			Jobtitle varchar(100),
			Employeeperjob	  int,
			Avgage			  int,
			Avgsalary		  int)

		INSERT INTO #temp_employee
		SELECT Jobtitle, COUNT(Jobtitle), AVG(Age),AVG(Salary)
		FROM employeeDemographics
		JOIN EmployeeSalary
		ON employeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
		WHERE	Jobtitle = @Jobtitle
		GROUP BY Jobtitle
SELECT * FROM #temp_employee

EXEC Temp_Employee @Jobtitle='Salesman'

/*		SUBQUERY IN SELECT
*/

SELECT firstname, lastname FROM  employeeDemographics
WHERE Age<(SELECT avg(Age) FROM employeeDemographics)

SELECT * FROM EmployeeSalary
WHERE EmployeeID in (SELECT EmployeeID
					 FROM	employeeDemographics
					 WHERE	Age>30)
