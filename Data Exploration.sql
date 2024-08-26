

-- Project | SQL Data Exploration

		select * from ['covid deaths$']
		select * FROM ['covid vaccinations$']

		--SELECT DATA THAT WE ARE GOING TO USE
		SELECT location, date, total_cases, new_Cases, TOTAL_deaths, population
		FROM ['covid deaths$']

		--LOOKING AT TOTAL CASES VS TOTAL DEATHS
		SELECT LOCATION, DATE, total_cases, total_deaths, (total_deaths/total_cases)*100 as DEATHPERCENT
		FROM ['covid deaths$'] where LOCATION LIKE '%STATE%'

		--TOTAL CASES BY LOCATION
		SELECT location, SUM(total_cases) AS TOTAL_CASES FROM ['covid deaths$']
		group by location
		ORDER BY TOTAL_CASES DESC

		--SHOW WHAT PERCENTAGE OF PULATION HAS COVID
		select  location, date, population, ROUND((total_cases/population)*100,2) AS poblacion_contagiada
		FROM ['covid deaths$']  WHERE LOCATION LIKE '%STATE%'

		--SHOW THE COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION
		SELECT LOCATION, population, MAX(total_cases) as Highest_Infection,
			   round(MAX((TOTAL_CASES/population)*100),2) as Highest_rate_of_population_infected
		FROM ['covid deaths$'] 
		GROUP BY location, population
		ORDER BY Highest_Infection DESC, Highest_rate_of_population_infected DESC
		--showing countries with highest deaths count per population
		SELECT * FROM ['covid deaths$']

		SELECT location, CAST(MAX(total_deaths) as int ) as H_deaths FROM ['covid deaths$']
		group by location --SIN EL CAST SE ORDENA PORQUE ES NVARCHAR
		order by H_deaths DESC
		
		SELECT location,date, total_deaths FROM ['covid deaths$']
		WHERE LOCATION in ('Europe','World')
		order by total_deaths desc

		
		SELECT * FROM ['covid deaths$']
		SELECT location, ROUND(MAX(total_deaths/population*100),2) as H_deaths_per_population FROM ['covid deaths$']
		group by location
		order by H_deaths_per_population DESC

		--LETS BREAK DOWN THINKS BY CONTINNENT

		SELECT continent, MAX(CAST(total_deaths as int)) as deaths_continent FROM ['covid deaths$']
		WHERE continent IS NOT NULL
		GROUP BY continent
		ORDER BY deaths_continent DESC

		SELECT location, MAX(CAST(total_deaths as int)) as total_deaths_by_location
		FROM ['covid deaths$']
		WHERE total_deaths is not null ---Van col que estan en la tabla principal
		GROUP BY location
		ORDER BY total_deaths_by_location  DESC
	---covertir A TRAVES DE CAST los nvarchar o varchar a int 
	--SI es float no importa

		SELECT location, MAX(CAST(total_deaths as int)) as total_deaths_by_location
		FROM ['covid deaths$']
		WHERE continent like 'South%' AND total_deaths IS NOT NULL ---Van col que estan en la tabla principal
		GROUP BY location
		ORDER BY total_deaths_by_location  DESC

		--getting total numbers by continent
		SELECT DATE, SUM(new_cases)	AS total_cases, 
					 SUM(CAST(new_deaths as int))	AS total_deaths,
					SUM(CAST(new_deaths as int))/SUM(new_cases)*100.0	AS DeathPercentage
		FROM ['covid deaths$']
		WHERE FORMAT(DATE, 'MM-dd') IN ('03-01', '03-08', '03-15', '03-22', '03-29', '04-05', '04-12', '04-19', '04-26')
		GROUP BY DATE
		ORDER BY DATEll
 
-- Portfolio Project | Data Cleaning in SQL