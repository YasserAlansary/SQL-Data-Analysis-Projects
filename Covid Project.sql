--select data that we are going to use 
select distinct location, date, total_cases, new_cases, total_deaths, population
from project..covid_deaths
order by 1,2

--looking at total cases vs total death in different places
select distinct location, date,total_cases, total_deaths, (total_deaths/total_cases)* 100 as Death_Percentage 
from project..covid_deaths
where location like '%states%'
order by 1,2

-- Showing what percentage of population get covid
select distinct location, date,total_cases, population, (total_cases/population)* 100 as cases_Percentage 
from project..covid_deaths
where location like '%states%'
order by 1,2

-- Looking at countries with highest infection rate compared to population 
select distinct location, max(total_cases) as Highest_infection , population, max((total_cases/population))* 100 as 
Percentage_population_infected 
from project..covid_deaths
group by location, population
order by 4 desc

--showing countries with highest death count per population 
select distinct location, max(cast(total_deaths as int)) as Highest_Death
from project..covid_deaths
where continent is not null
group by location
order by 2 desc

--Let's break things down by Continent 
--showing contnients with the highest cases count per population
select continent, max(cast(total_cases as int)) as Total_cases
from project..covid_deaths
where continent is not null
group by continent
order by 2 desc
--showing contnients with the highest death count per population
select continent, max(cast(total_deaths as int)) as Total_Death
from project..covid_deaths
where continent is not null
group by continent
order by 2 desc

--Globle Numbers 
--showing cases and death numbers per day 
select date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_death,
(sum(cast(new_deaths as int))/sum(new_cases))*100 as Death_Percentage 
from project..covid_deaths
where continent is not null 
group by date
order by 1
--showing total numbers till now
select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_death, 
(sum(cast(new_deaths as int))/sum(new_cases))*100 as Death_Percentage 
from project..covid_deaths
where continent is not null 
order by 1

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
Select distinct dea.location,dea.continent,dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.Date) 
as People_Vaccinated
from project..covid_vaccination vac
join project..covid_deaths dea
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 1
-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations,People_Vaccinated)
as
(
Select distinct dea.location,dea.continent, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.Date) 
as People_Vaccinated
from project..covid_vaccination vac
join project..covid_deaths dea
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
)
Select *, (People_Vaccinated/Population)*100
From PopvsVac


--Temp Table 
create table PercentPeopleVaccinated
(
	 continent nvarchar(255),
	 location nvarchar(255),
	 date datetime,
	 population numeric,
	 new_vaccinations numeric,
	 People_Vaccinated numeric
)
insert into PercentPeopleVaccinated
 Select distinct dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.Date) 
as People_Vaccinated
from project..covid_vaccination vac
join project..covid_deaths dea
	On dea.location = vac.location
	and dea.date = vac.date


Select *, (People_Vaccinated/Population)*100
From PercentPeopleVaccinated

--drop view if exists PercentPeopleVaccinated
--create views for visualization
create view continenttotalcases 
as select continent, max(cast(total_cases as int)) as Total_cases
from project..covid_deaths
where continent is not null
group by continent
--order by 2 desc
 
create view PercentPeopleVaccinated as 
 Select distinct dea.location,dea.continent, dea.date, dea.population, vac.new_vaccinations
,SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.Date) 
as People_Vaccinated
from project..covid_vaccination vac
join project..covid_deaths dea
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 



