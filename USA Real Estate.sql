--Number of cities for each state 
select 
	state, count(city) Cities
from
	Realtor..Houses
group by 
	state
order by 
	Cities desc

--Average of houses size in each city per sqft
select 
	 city, avg(house_size) Houses_Size
from 
	Realtor..Houses
group by
	city
order by	
	Houses_Size desc

--Average prices in each city
select 
	 city, avg(price) Average_Prices 
from 
	Realtor..Houses
group by
	city
order by	
	Average_Prices desc

--Number of houses in each city
select 
	 city, count(number) Houses
from 
	Realtor..Houses
group by
	city
order by	
	Houses desc

--Each city's number of properly constructed houses
select 
	 city, sum(structured) Houses
from 
	Realtor..Houses
group by
	city
order by	
	Houses desc

--The best cities in terms of social standing
select 
	 city, count(type) Houses
from 
	Realtor..Houses
where 
		type = 'palace' or type = 'mansion'
group by
	city
order by	
	Houses desc

--Best cities for families 
select 
	 city, AVG(places) Places
from 
	Realtor..Houses
where 
	type = 'house' or type = 'moderate house' or type = 'villa'
group by
	city
order by	
	Places desc

--Number of houses in each state and Average price per sqft 
select 
	 state, count(number) Houses
from 
	Realtor..Houses
group by
	state
order by	
	Houses desc

--Average of houses size and prices for each state
select 
	 state, avg(house_size) Houses_size, avg(price) Prices
from 
	Realtor..Houses
group by
	state
order by	
	Houses_size desc

--Best states for families
select 
	 state, count(number) Houses 
from 
	Realtor..Houses
where 
	places >= 6
group by
	state
order by	
	Houses desc

--The best states in terms of privacy and tranquility
select 
	 state, count(type) Houses
from 
	Realtor..Houses
where 
		type = 'palace' or type = 'mansion'
group by
	state
order by	
	Houses desc

-- Top 10 Most Expensive Streets in the United States
select 
	top 10 street,avg(price_per_sqft) Price
from 
	Realtor..Houses
group by 
	street
order by 
	Price desc

--Top 10 Street For Properly Built Homes
select 
	top 10 street, sum(structured) Houses 
from 
	Realtor..Houses
where 
	street is not null
group by 
	street
order by 
	Houses desc

--The best streets in the country
select 
	top 25 street
from 
	Realtor..Houses
where 
	street is not null and places >= 6 and house_size > 509910 and price > 438366 and  price < 2469902
group by 
	street

--Top ten streets with houses for sale
select 
	top 10 street, count(number) Houses 
from 
	Realtor..Houses
where 
	street is not null and street != 'Pr'
group by 
	street
order by 
	Houses desc
