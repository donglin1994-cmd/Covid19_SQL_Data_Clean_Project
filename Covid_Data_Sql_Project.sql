Select * From CovidDeaths;
Select * From CovidVaccination;

-- The location with the highest death counts
Select location, Max(cast(total_deaths As int)) as totaldeathcount From CovidDeaths
Group by location
Order by totaldeathcount Desc;

-- The likelihood of dying and what percentage of people infected with covid for each location 

Select location, date, total_cases,total_deaths, (cast(total_deaths As int)/ total_cases )*100 As death_rate,
(total_cases /Cast(population As bigint ))*100 as infected_rate
From CovidDeaths;
--Where location like '%states%'


--- Total number of deaths and cases in the world 
Select sum(cast(new_cases As int)) As totalcases, sum(cast(new_deaths As int))As totalnewdeaths From CovidDeaths;


-- Create a temporary table; name a new column called vaccinations_previous_day;
With Vaccination_Info As (
Select dea.date, dea.location, dea.population, vac.new_vaccinations,
LAG(cast(vac.new_vaccinations as bigint)) Over 
(partition by vac.location order by vac.date
) As vaccinations_previous_day From CovidDeaths dea inner join 
CovidVaccination vac on dea.date = vac.date and dea.location= vac.location
where new_vaccinations is not null and new_vaccinations <>0),

---- Calculate the percent change in the value of new vaccinations for each day
Vaccination_percent_change As(Select *,
 COALESCE(ROUND((cast(new_vaccinations as bigint) - vaccinations_previous_day) / vaccinations_previous_day * 100,2), 2)
 AS percent_change
 From Vaccination_Info)
--- Use conditional statement to define if percent_change is increase, no change, or decrease
 Select *,
  Case
   When percent_change > 0 Then 'increase'
   When percent_change = 0 Then 'no change'
   Else 'decrease'
   End trend
From Vaccination_percent_change;



