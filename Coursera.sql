--Enrolled student are counted in thousands
--Important data
select 
	 Count(distinct organization) as Organizations, count(title) as Courses,Round(Avg(students_enrolled),2) as Students
from 
	Coursera..data

--Number of courses for each Certificate Type
select
	Certificate_type, count(title) as Courses
from 
	Coursera..data
group by 
	Certificate_type
order by
	Courses desc

--Number of courses per level
select
	difficulty, count(title) as Courses
from 
	Coursera..data
group by 
	difficulty
order by
	Courses desc

--Number of courses per organization
select
	organization, count(title) as Courses
from 
	Coursera..data
group by 
	organization
order by
	Courses desc

--Best courses 
select 
	Top 10 title, rating
from 
	Coursera..data
where 
	students_enrolled > 50
order by 
	rating desc

--Best Specializations
select 
	Top 10 title, rating
from 
	Coursera..data
where 
	Certificate_type ='SPECIALIZATION'  and students_enrolled > 50	
order by 
	rating desc

--The best courses for beginners
select 
	title, rating
from 
	Coursera..data
where 
	difficulty ='Beginner'  and students_enrolled > 50	
order by 
	rating desc

--Best courses for Intermediate level
select 
	title, rating
from 
	Coursera..data
where 
	difficulty ='Intermediate'  and students_enrolled > 50	
order by 
	rating desc

--Best Organizations
select 
	Top 20 organization, Round(avg(rating),2) as Rating
from 
	Coursera..data
where 
	 students_enrolled > 50
group by 
	organization
order by 
	rating desc

--Highest courses by number of students enrolled
select 
	top 8 title, students_enrolled
from 
	Coursera..data
where 
	Certificate_type = 'COURSE'
order by 
	students_enrolled desc

--Highest Specializations by number of students enrolled
select 
	top 8 title, students_enrolled
from 
	Coursera..data
where 
	Certificate_type = 'SPECIALIZATION'
order by 
	students_enrolled desc

-- Highest Organization by number of students enrolled
select 
	top 8 organization, students_enrolled
from 
	Coursera..data
order by 
	students_enrolled desc


