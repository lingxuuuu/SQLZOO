--Easy Questions

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


-- Medium Questions

/* 6. List the Company name and the number of calls for those companies with more than 18 calls. */

select c.company_name, caller.count(caller_id) as cc
from customers c
join caller
using company_ref
join issue
using caller_id
group by 1
having cc > 18

/* 7. Find the callers who have never made a call. Show first name and last name */

select c.first_name, c.last_name
from caller c
left join issue
using caller_id
where status is null

/* 8. For each customer show: Company name, contact name, number of calls where the number of calls is fewer than 5 */

SKIP

/* 9. For each shift show the number of staff assigned. Beware that some roles may be NULL and that the same person might have been assigned to multiple roles (The roles are 'Manager', 'Operator', 'Engineer1', 'Engineer2'). */

select shift_date, shift_type, count(distinct role) as cw
from
(select shift_date, shift_type, manager as role from shift
uinon all
select shift_date, shift_type, operator as role from shift
uinon all
select shift_date, shift_type, engineer1 as role from shift
uinon all
select shift_date, shift_type, engineer2 as role from shift) t
group by 1,2

/* Caller 'Harry' claims that the operator who took his most recent call was abusive and insulting. Find out who took the call (full name) and when. */

select staff.first_name, stuff.last_name, issue.call_date
from staff
join issue
on staff.staff_code = issue.taken_by
join caller
using caller_id
where caller.first_name = 'Harry'
order by issue.call_date desc
limit 1

-- Hard Questions












