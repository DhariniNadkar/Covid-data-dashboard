select *,location,date,total_cases,new_cases,total_deaths,population
from PortfolioProject..covid_deaths order by 1,2;

--looking at total_cases vs total_deaths
Select location, date, total_cases, total_deaths,  (CONVERT(DECIMAL, total_deaths) / CONVERT(DECIMAL, total_cases) )*100 as death_percentage
from PortfolioProject..covid_deaths
where location like '%Asia%'
order by 1,2;

--looking at total_cases vs population
Select location,date,population,total_cases,(CONVERT(float, total_cases) / NULLIF(CONVERT(float, population), 0))*100 as death_percentage
from PortfolioProject..covid_deaths
--where location like '%Asia%'
order by 1,2;

--looking at new_cases vs population
Select location,date,population,new_cases,(CONVERT(float, new_cases) / NULLIF(CONVERT(float, population), 0))*100 as cases_percentage
from PortfolioProject..covid_deaths
--where location like '%Asia%'
order by cases_percentage DESC;

--looking at highest infection 
Select location,date,population,MAX(new_cases),MAX((CONVERT(float, new_cases) / NULLIF(CONVERT(float, population), 0)))*100 as highestInfection_percentage
from PortfolioProject..covid_deaths
where location like '%Asia%'
GROUP BY population
order by highestInfection_percentage DESC;



select location,MAX(cast(total_deaths as int)) AS totalDeathsCount
from PortfolioProject..covid_deaths
WHERE location is not null
GROUP BY location
ORDER BY totalDeathsCount DESC;