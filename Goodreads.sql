--Arranging books according to page count
select title, pages 
from Goodreads..books
order by pages desc;

--Title length
select id ,title, len(title) as Title_charactars 
from Goodreads..books
where title is not null
order by Title_charactars asc;

--Books with a rate higher than 4  
select title, average_rating
from Goodreads..books
where average_rating > 4
order by average_rating desc;

--Highest-Rated Books 
select Top 100 title, ratings_count, average_rating
from Goodreads..books
order by ratings_count desc;

--Books with more than 10 text reviews
select title, text_reviews_count
from Goodreads..books
where text_reviews_count > 10
order by text_reviews_count desc;

--The authors with the highest scores
select author, average_rating
from Goodreads..books
where average_rating > 4 and author2 is null 
order by average_rating desc;

--best authors
select title,author,author2,author3, average_rating
from Goodreads..books
where average_rating > 0 and author3 is not null 
order by average_rating desc;

--Number of books published by the top 25 publishers
select Top 25 publisher ,count(title) as Books 
from Goodreads..books
where publisher is not null
group by publisher 
order by Books desc;

--The number of authors who have a contract with publishers
select Top 20 publisher, count(author) as Authors 
from Goodreads..books
where publisher is not null
group by publisher ,author
order by Authors desc;

--Number of books for each author.
select author, Books 
from
(select author, count(title) as Books 
	from Goodreads..books
	where author2 is null
	group by author) as A 
where Books > 5
order by Books desc;

--Average of rates for each book 
select avg(ratings) as Avg_book_rating
from(
	select sum(ratings_count) as ratings
	  from Goodreads..books
	  group by title ) as Books

--Average of rates for each publisher
select avg(ratings) as Avg_publisher_rating
from(
	select sum(ratings_count) as ratings
	  from Goodreads..books
	  group by publisher ) as Publisher
