--Easy questions

/* 1. There are three issues that include the words "index" and "Oracle". Find the call_date for each of them */

SELECT call_date, call_ref
FROM Issue
where detail like "%index%"
and detail like "%Oracle";

/* 2. Samantha Hall made three calls on 2017-08-14. Show the date and time for each */

select i.call_date,c.first_name, c.last_name
from issue i
join caller c
on c.caller_id = i.call_ref
where 
s.first_name = 'Samantha'
and s.last_name = 'Hall'
and left(i.call_date, 10) = 2017-08-14

/* 3. There are 500 calls in the system (roughly). Write a query that shows the number that have each status. */

select status,
      count(*) as Volume
from Issue
group by status

/* 4. Calls are not normally assigned to a manager but it does happen. How many calls have been assigned to staff who are at Manager Level? */

select count(distinct(assigned_to))
from Issue
join Staff
on staff.staff_code = issue.assigned_to
join level
on staff.level_code = level.level_code
where level.manager = 'Y'

/* 5. Show the manager for each shift. Your output should include the shift date and type; also the first and last name of the manager. */

select s.shift_date, s.shift_type, staff.first_name, staff.last_name
from shift s
join staff
on s.manager = staff.staff_code
order by shift.shift_date



