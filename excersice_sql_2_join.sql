# SQL Join exercise
#
use world;
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
select * from world.city where Name like 'ping%' order by Population asc; 
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
select * from world.city where Name like 'ran%' order by Population desc;
#
# 3: Count all cities
select count(ID) from world.city;
#
# 4: Get the average population of all cities
select avg(Population) from world.city;
#
# 5: Get the biggest population found in any of the cities
select * from world.city where Population=(select max(Population) from world.city);
#
# 6: Get the smallest population found in any of the cities
select * from world.city where Population=(select min(Population) from world.city);
#
#
# 7: Sum the population of all cities with a population below 10000
select sum(Population) from world.city where Population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
select count(CountryCode) from world.city where CountryCode in ('MOZ','VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
select count(CountryCode), CountryCode from world.city where CountryCode in ('MOZ','VNM') group by CountryCode;
#
# 10: Get average population of cities in MOZ and VNM
select avg(Population), CountryCode from world.city where CountryCode in ('MOZ','VNM') group by CountryCode;
#
# 11: Get the countrycodes with more than 200 cities
select count(CountryCode) as 'City count', CountryCode from world.city group by CountryCode having count(CountryCode)>200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
select count(CountryCode) as 'City count', CountryCode from world.city group by CountryCode having count(CountryCode)>200 order by count(CountryCode);
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
select city.Population, city.CountryCode, countrylanguage.Language
from world.city
inner join world.countrylanguage on city.CountryCode=countrylanguage.CountryCode
where city.Population between 400 and 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
select city.Population, city.Name, city.CountryCode, countrylanguage.Language
from world.city
inner join world.countrylanguage on city.CountryCode=countrylanguage.CountryCode
where city.Population between 500 and 600
order by city.Name;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
select city.Name as 'City', country.Name as 'Country'
from world.city
join world.country on city.CountryCode=country.Code
where city.Population=122199;
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
#
# 17: What are the city names in the country where Luanda is capital?
#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
select countrylanguage.Language
from((world.city
inner join world.country on city.CountryCode=country.Code)
inner join world.countrylanguage on city.CountryCode = countrylanguage.CountryCode)
where city.Name='Riga';
#
# 20: Get the name of the most populous city
select city.Name from world.city where Population=(select max(Population) from world.city);
