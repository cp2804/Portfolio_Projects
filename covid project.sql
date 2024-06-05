select *
from Portfolio_project..CovidVaccination

select *, CAST (date AS DATE) AS formatted_date
from Portfolio_project..CovidDeaths
order by formatted_date

select location, date,total_cases,new_cases,total_deaths,population
from Portfolio_project..CovidDeaths


select location, date,total_cases,new_cases,total_deaths,population,(total_deaths/total_cases)
from Portfolio_project..CovidDeaths

--Looking at Total death vs Total cases

Select location, date, total_cases,total_deaths, 
(cast( total_deaths as float) / CAST( total_cases as float)) * 100 AS Deathpercentage
from Portfolio_project..CovidDeaths 
where location like 'India'

--Looking at total cases VS population
Select location, date, total_cases,population, 
(CAST( total_cases as float) / population) * 100 AS Percentageofpopulation
from Portfolio_project..CovidDeaths 
where location like 'India'

--Looking at the countries with Highest infection rate compared to the population

Select location,population,max(total_cases)as HighestinfectionCount,
MAX(CAST( total_cases as bigint) /CAST( population as bigint)) * 100 AS Percentageofpopulation
from Portfolio_project..CovidDeaths 
group by location,population
--where location like 'India'
order by 1

--Showing highest death count as per population

SELECT location, MAX(CAST(total_deaths AS bigint)) AS totaldeathcount
FROM Portfolio_project..CovidDeaths
WHERE location NOT IN ('World','Africa ', 'Europe', 'North America', 'European Union', 'South America', 'Asia')
GROUP BY location
ORDER BY totaldeathcount DESC;

-- Showing continents with highest Death count 
SELECT location, MAX(CAST(total_deaths AS bigint)) AS totaldeathcount
FROM Portfolio_project..CovidDeaths
WHERE location IN ('World','Africa ', 'Europe', 'North America', 'European Union', 'South America', 'Asia')
GROUP BY location
ORDER BY location, totaldeathcount DESC;

--GLOBAL NUMBERS

Select SUM(cast(new_cases as float)) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as float))/SUM(cast(New_Cases as float))*100 as DeathPercentage
From Portfolio_project..CovidDeaths
where continent is not null 
order by 1,2

select *
from Portfolio_project..CovidDeaths dea
join Portfolio_project..CovidVaccination vac
on dea.location = vac.location and
dea.date = vac.date

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Portfolio_project..CovidDeaths dea
Join Portfolio_project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3


-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Portfolio_project..CovidDeaths dea
Join Portfolio_project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac



-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Portfolio_project..CovidDeaths dea
Join Portfolio_project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated




-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Portfolio_project..CovidDeaths dea
Join Portfolio_project..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

