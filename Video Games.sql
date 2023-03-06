--Development of games over years
select Year ,count(Name) as Numbers
from vgsale
where Year is not null 
group by Year
order by Year asc;

--All sales numbers in this database are in millions of dollars.
--Total Sales 
select sum(Global_Sales) as Total_Sales, sum(NA_Sales) As NorthAmerica_sales,
sum(EU_Sales)as EuropeanUnion_sales, sum(JP_Sales) as Japan_sales
from vgsale;

--Development of sales over years
select Year,sum(Global_Sales) as Sales
from vgsale
where Year is not null 
group by Year
order by Year desc;

-- Total sales for each game 
select Name,sum(Global_Sales) as Sales
from vgsale
where Name is not null 
group by Name 
order by Sales desc;

--Number of games and total sales for each Genre
select Genre,count(Name) as Numbers,sum(Global_Sales ) as Sales
from vgsale
where Name is not null 
group by Genre
order by Numbers desc;

--Total sales for each Genre
select Genre ,sum(Global_Sales ) as Sales
from vgsale
where Genre is not null
group by Genre
order by Sales desc;

--Total sales for Publishers Globally
select Publisher ,sum(Global_Sales) as Sales
from vgsale
where Publisher != 'unknow'
group by Publisher
order by Sales desc;

--Number of games and total sales for the top 10 publishers
select Top 10 Publisher, count(Name) as Numbers ,sum(Global_Sales) as sales
from vgsale 
where Publisher != 'unknow' 
group by Publisher
order by Numbers desc;

--Top 5 best selling publishers in North America
select Top 5 Publisher ,sum(Global_Sales) as Sales 
from vgsale
where Publisher != 'unknow'
group by Publisher
order by Sales desc;

--Total number of games in each platform 
select Platform ,count(Name) as Games,sum(Global_Sales) as Sales
from vgsale
where Platform is not null
group by Platform 
order by Games desc;

--Total sales for top 10 platform in EU
select top 5 Platform ,sum(EU_Sales) as Sales
from vgsale 
where Platform is not null
group by Platform 
order by Sales desc;

