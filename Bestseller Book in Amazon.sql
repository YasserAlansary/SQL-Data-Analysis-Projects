--The number of books in each genre
select 
	genre, count(title) as Titles 
from
	Books..bestsellers
group by 
	genre

--Best books 
select 
	Top 10 title, user_rating
from
	Books..bestsellers
where 
	reviews > 9000
order by 
	user_rating desc

--Best fiction books
select 
	top 5 title, user_rating
from
	Books..bestsellers
where 
	genre = 'Fiction' and reviews > 9000
order by 
	user_rating desc

--Best non fiction books
select 
	top 5 title, user_rating
from
	Books..bestsellers
where 
	genre = 'Non Fiction' and reviews > 9000
order by 
	user_rating desc

--Best Authors 
select 
	top 10 author, avg(user_rating) as Rating 
from
	Books..bestsellers
where 
	reviews > 9000
group by
	author
order by 
	 Rating desc

--Authors with the most publications
Select 
	top 10 author, count(title) as Books
from
	Books..bestsellers
group by
	author
order by 
	 Books desc

--Number of books per year
select
	year,count(title) as Books 
from
	Books..bestsellers
group by
	year
order by 
	 Books desc

