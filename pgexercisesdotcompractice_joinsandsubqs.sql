--Statements based on exercises from: https://pgexercises.com/
--Completed: 6//18
--Jewel Langevine

--Joins and Subqueries--

/*
Question
How can you produce a list of the start times for bookings by members named 'David Farrell'?
*/
select b.starttime 
from cd.bookings b, cd.members m
where b.memid = m.memid
and CONCAT(m.firstname,' ', m.surname) LIKE 'David Farrell';