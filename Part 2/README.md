## PART2 - "Employment Dataset Queries”


### 2.1 Problem 1
Find all employees' employee number, birth date, gender. Sort the result by
employee number. The result of query is similar to following table:
emp_no birth_date gender
10001 1953-09-02 M
10002 1964-06-02 F
10003 1959-12-03 M
...
### 2.2 Problem 2
Find all female employees and sort the result by employee number. The result
of query is similar to following table:
emp_no birth_date first_name last_name gender hire_date
10002 1964-06-02 Bezalel Simmel F 1985-11-21
10006 1953-04-20 Anneke Preusig F 1989-06-02
...
### 2.3 Problem 3
Find all employees' last name with their salaries in dierent periods. Sort the
result by last name, salary, from date, then to date. The result of query is
similar to following table:
last_name salary from_date to_date
Aamodt 39537 1991-05-28 1992-05-27
Aamodt 39548 1986-12-31 1987-12-31
...
Acton 39202 1994-10-10 1995-10-10
Acton 39581 1993-10-10 1994-10-10
...
### 2.4 Problem 4
Find all employees' current department and the start date with their employee
number and sort the result by employee number. The result of query is similar
to following table:
emp_no dept_name from_date
10001 Development 1986-06-26
10002 Sale 1996-08-03
10003 Production 1995-12-03
...
### 2.5 Problem 5
List the number of employees in each department. Sort the result by department
name. The result of query is similar to following table:
dept_name noe
Customer Service 23580
Development 85707
...
### 2.6 Problem 6
List pairs of employee (e1; e2) which satises ALL following conditions:
1. Both e1 and e2's current deparmnet number is d001.
2. The year of birthdate for e1 and e2 is 1955.
3. The e1's employee number is less than e2.
Sort the result by e1 then e2. The result of query is similar to following table:
e1 e2
10239 10367
10239 11251
...
10367 11251
10367 11554
...
### 2.7 Problem 7
For each department, list out the manager who stayed the longest time in the
department. The list needs to exclude the current manager. Sort the result by
employ number. The result of query is similar to following table:
emp_no dept_name
110022 Marketing
110085 Finance
...
### 2.8 Problem 8
Find out departments which has changed its manager more than once then list
out the name of the departments and the number of changes. Sort the result
by department name. The result of query is similar to following table:
dept_name cnt
Customer Service 3
...
### 2.9 Problem 9
For each employee, nd out how many times the title has been changed without
chaning of the salary. e.g. An employee promoted from Engineer to Sr. Engineer
with salaries remains 10k. Sort the result by employ number. The result of query
is similar to following table:
emp_no cnt
10004 1
10005 1
10007 1
10009 2
...
### 2.10 Problem 10
Find out those pairs of employees (eH; eL) which satisfy ALL following condi-
tions:
1. Both eH and eL born in 1965
2. eH's current salary is higher than eL's current salary
3. eH's hiring date is greater than eL, which means eH is a newer employee
than eL.
Sort the result by employee number of eH then employee number of el.
Result is shown as table below:
h_empno h_salary h_date l_empno l_salary l_date
10095 80955 1986-07-15 17206 55078 1986-02-25
10095 80955 1986-07-15 18617 66957 1986-06-28
...
 h empno : eH's employee number
 h salary : eH's current salary
 h date : eH's hire date
 l empno : eL's employee number
 l salary : eL's current salary
 l date : eL's hire date
### 2.11 Problem 11
Find the employee with highest current salary in each department. Note that
MAX function is not allowed. Sort the result by department name. Result is
shown as table below:
dept_name emp_no salary
Customer Service 18006 144866
Development 13386 144434
...
### 2.12 Problem 12
Calculate the percentage of number of employees' current salary is above the
department current avarage. Sort the result by department name. The result
is shown as following:
dept_name above_avg_pect
Customer Service 44.4988
Development 46.6018
...
As the gure shows, there are 51.9825 % employees in Development department
has their current salary above the average of current salary in Development
department.
### 2.13 Problem 13
Assuming a title is a node and a promotion is an edge between nodes. e.g.
And promotion from Engineer to Senior Engineer means their is a path from
Node 'Engineer' to Node 'Senior Engineer'. Find out pairs of node of source
and destination (src, dst) which there is no such path in the database. Sort the
result by src then dst. The result is shown as following:
src dst
Assistant Engineer Assistant Engineer
Engineer Assistant Engineer
...
The result table shows that there is no path from Assistant Engineer to Assistant
Engineer and neither Engineer to Assistant Engineer. That means there is no
one have been from Engineer and be promoted/demoted to Assistant Engineer
(no matter how many times of promotion/demotion) in the database.
### 2.14 Problem 14
Continued from problem 13, assumeing we treat the years from beginning of a
title until promotion as the distance between nodes. e.g. An employee started as
an Assistant Engineer from 1950-01-01 to 1955-12-31 then be promoted to En-
gineer on 1955-12-31. Then there is an edge between node "Assistant Engineer"
to "Engineer" with distance 6.
Calculate the average distance of all possible pair of titles and ordered by
source node. To simplify the problem, there is no need to consider months and
date when calculating the distance. Only year is required for calculating the
distance. Besides, we can assume the distances of any given pair is less than
100.
Sort the result by src then dst. The expected result is shown as follow:
src dst years
Assistant Engineer Engineer 7.7926
Assistant Engineer Manager 20.5266
...
Engineer Manager 12.7340
...
As the table shows, the average distance between node "Assistant Engineer" and
node "Engineer" is 7.7926. We add it with the distance between "Engineer"
to "Manager", which is 12.7340, to nd out the distance between "Assistant
Engineer" to "Manager" is 20.5266.
