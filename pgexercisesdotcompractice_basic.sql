--Statements based on exercises from: https://pgexercises.com/
--Completed: 6/18/18
--Jewel Langevine

--Basic--

/*
Question
How can you retrieve all the information from the cd.facilities table?
*/

select * from cd.facilities;

/*
Question
You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
*/

select name,membercost from cd.facilities;

/*
Question
How can you produce a list of facilities that charge a fee to members?
*/

select * from cd.facilities where membercost > 0;

/*
Question
How can you produce a list of facilities that charge a fee to members, and that fee is less than 
1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
*/

select facid, name, membercost, monthlymaintenance 
from cd.facilities
where membercost > 0 and monthlymaintenance > 0 and membercost < (monthlymaintenance/50);


/*
Question
How can you produce a list of all facilities with the word 'Tennis' in their name?
*/
select * from cd.facilities where name ilike '%Tennis%';

/*
Question
How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
*/

select * from cd.facilities where facid in (1,5);

/*
Question
How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their 
monthly maintenance cost is more than $100? Return the name and monthly maintenance of the facilities in question.
*/

select name, 
	CASE WHEN monthlymaintenance > 100 THEN 'expensive'
	WHEN monthlymaintenance < 100 THEN 'cheap'
	ELSE 'cheap' END AS cost
from cd.facilities;

/*
Question
How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, 
firstname, and joindate of the members in question.
*/

select memid, surname, firstname, joindate 
from cd.members 
where joindate > '2012-09-01 00:00:00';

/*
Question
How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
*/

select distinct surname
from cd.members
order by surname ASC
limit 10;

/*
Question
You, for some reason, want a combined list of all surnames and all facility names. Yes, this is a contrived example :-). Produce that list!
*/

select m.surname as surname
from cd.members m
union
select f.name as surname
from cd.facilities f;

/*
Question
You'd like to get the signup date of your last member. How can you retrieve this information?
*/

select max(joindate) as latest
from cd.members;

/*
Question
You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?
*/

select firstname, surname, joindate
from cd.members
where joindate in (select max(joindate) from cd.members);
