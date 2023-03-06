--Show total numbers for different products like movies and TV shows
select type,count(title) as Numbers
from Netflix..netflix_titles
group by type;

--Show total numbers for all products in each year.
select type,release_year ,count(distinct  title) as Year_Productions 
from Netflix..netflix_titles
where release_year is not null and release_year >= 2000
group by type,release_year
order by type ,release_year asc;

--Show Top 10 director at all times.
select TOP 10 director, count(title) as Productions 
from Netflix..netflix_titles
where director is not null
group by director
order by Productions  desc;

--How much has Netflix produced in each country?
select country, count(title) as Productions 
from Netflix..netflix_titles
where country is not null 
group by country
order by Productions  desc;

--Display the length of TV shows.
select title,duration,release_year
from Netflix..netflix_titles
where duration like '% Seasons'
order by duration desc

--Display the number of titles in each rating.
select rating,COUNT(title) as numbers
from Netflix..netflix_titles
group by rating
order by numbers desc 

--View the most popular praedicamenta.
select listed_in,COUNT(title) as numbers 
from Netflix..netflix_titles 
where listed_in not like '%min%'
group by listed_in
order by numbers desc 





