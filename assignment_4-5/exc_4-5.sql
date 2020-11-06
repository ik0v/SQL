 # 1.1 Get names of all countries in Europe, sorted alphabetically.

SELECT name 
FROM world 
WHERE continent = 'Europe' 
ORDER BY name;

 # 1.2 Get names of all countries apart from Europe.

SELECT name 
FROM world 
WHERE continent != 'Europe';

 # 1.3 Get population of each country in all parts of Asia.

SELECT name, population 
FROM world 
WHERE continent LIKE '%asia%';

# 1.4 Get country name begynning with 'Ne' or 'No'

SELECT name 
FROM world 
WHERE name LIKE 'Ne%' OR name LIKE 'No%';

# 1.5 Get all countries with population between 4 and 6 millions.

SELECT * FROM world 
WHERE population BETWEEN 4000000 AND 6000000;

# 1.6 Count all countries in table
SELECT COUNT(*) AS nr_countries 
FROM world;

# 1.7 Count countries with populatione between 4 and 6 millions.

SELECT COUNT(*) AS nr_countries
FROM world
WHERE population 
BETWEEN 4000000 AND 6000000;

# 1.8 Get average population per square km in whole Europe.

SELECT ROUND(AVG(population/area),2) 
AS 'pop density in Europe'
FROM world
WHERE continent = 'Europe';

# 1.9 Count nr countries for each continent.

SELECT continent, COUNT(*) AS 'nr countries'
FROM world
GROUP BY continent;

# 1.10 Get continents with more than 10 countries.

SELECT continent, COUNT(*) AS 'nr countries' 
FROM world
GROUP BY continent
HAVING COUNT(*) >10;






