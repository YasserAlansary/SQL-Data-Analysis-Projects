--Numbers of movies and showes 
select 
	type, count(title) as Titles
from 
	Amazon_Prime..titles
group by type

--The directors with the most works on the platform
select 
	top 10 director, COUNT(title) as Works
from
	Amazon_Prime..titles
where	
	director is not null and  director != '1' 
group by director
order by Works desc

--Best Directors
select 
	top 8 Director, avg(Works) as Work, Round(avg(Ratings),2) As Rating
from(
	select 
		 T.director as Director, Avg(M.IMDb_Rating) as Ratings, COUNT(title) as Works  
	from
		Amazon_Prime..titles T
	Join 
		Amazon_Prime..movies M
		on T.title = M.name
	where	
		director is not null and  director != '1' 
	group by director
	) As D
where 
	Works > 4
group by Director
order by Rating desc

--Number of works for each year 
select
	release_year, count(title) as Numbers
from
	Amazon_Prime..titles
where
	release_year is not null 
group by release_year
order by Numbers desc

--Number of works per category
select 
	listed_in as Category, count(title) as Numbers
from 
	Amazon_Prime..titles
where
	listed_in is not null and listed_in != 'TV Shows'
group by listed_in
order by Numbers desc

--Number of movies for each Maturity Rating
select 
	M.maturity_rating, count(T.title) as Movies 
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..movies M
	on T.title = M.name
where 
	T.type= 'Movie'
group by M.maturity_rating
order by Movies desc

--Top 10 Movies in library based on IMDb rating
select 
	Top 10 T.title,T.type,T.director, T.release_year, M.IMDb_Rating as Rating 
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..movies M
	on T.title = M.name
where 
	T.title is not null
order by Rating desc

--Top 15 movies That aren't english 
select 
	Top 15 T.title, T.type, T.director,M.language , M.IMDb_Rating as Rating 
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..movies M
	on T.title = M.name
where 
	M.language != 'English'
order by Rating desc

--Top 5 Drama Movies 
select
	Top 5 T.title,T.type,T.director, T.listed_in as Catgoray, M.IMDb_Rating as Rating 
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..movies M
	on T.title = M.name
where 
	T.listed_in = 'Drama'
order by Rating desc

--Top 5 Action Movies 
select 
	Top 5 T.title, T.type, T.director, T.listed_in as Catgoray, M.IMDb_Rating as Rating 
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..movies M
	on T.title = M.name
where 
	T.listed_in = 'Action'
order by Rating desc

--The longest 15 movie in platform 
select 
	top 15 title, director, Round(duration/ 60,2) as Duration  , listed_in as Catagory
from 
	Amazon_Prime..titles 
where 
	type ='Movie'
order by Duration desc

--Top 10 TV shows in library based on IMDb rating
select 
	top 10 T.title,S.seasons ,T.release_year, S.IMDb_Rating as Rating 
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..Shows S
	on T.title = S.name
where 
	type='TV Show'
order by Rating desc

--The longest 15 tv show in platform 
select 
	top 15 T.title,S.seasons ,T.release_year
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..Shows S
	on T.title = S.name
where 
	type='TV Show'
order by seasons desc

--Top 10 tv shows That aren't english 
select 
	Top 10 S.name, S.language, S.IMDb_Rating as Rating 
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..Shows S
	on T.title = S.name
where 
	S.language != 'English'
order by Rating desc

--Top 5 Drama TV Shows  
select 
	Top 8 T.title, T.type, T.listed_in as Catgoray, S.IMDb_Rating as Rating 
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..Shows S
	on T.title = S.name
where 
	T.listed_in = 'Drama'
order by Rating desc

--Top 8 Comedy TV Shows 
select 
	Top 8 T.title, T.type, T.listed_in as Catgoray, S.IMDb_Rating as Rating 
from 
	Amazon_Prime..titles T
inner join
    Amazon_Prime..Shows S
	on T.title = S.name
where 
	T.listed_in = 'Comedy'
order by Rating desc


 

