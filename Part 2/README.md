## PART2 - "Employment Dataset Queries”


### 2.1 Problem 1
Find all employees' employee number, birth date, gender. Sort the result by
employee number. The result of query is similar to following table:</br>
emp_no birth_date gender</br>
10001 1953-09-02 M</br>
10002 1964-06-02 F</br>
10003 1959-12-03 M</br>
...</br>
### 2.2 Problem 2
Find all female employees and sort the result by employee number. The result
of query is similar to following table:</br>
emp_no birth_date first_name last_name gender hire_date</br>
10002 1964-06-02 Bezalel Simmel F 1985-11-21</br>
10006 1953-04-20 Anneke Preusig F 1989-06-02</br>
...</br>
### 2.3 Problem 3
Find all employees' last name with their salaries in different periods. Sort the
result by last name, salary, from date, then to date. The result of query is
similar to following table:</br>
last_name salary from_date to_date</br>
Aamodt 39537 1991-05-28 1992-05-27</br>
Aamodt 39548 1986-12-31 1987-12-31</br>
...</br>
Acton 39202 1994-10-10 1995-10-10</br>
Acton 39581 1993-10-10 1994-10-10</br>
...</br>
### 2.4 Problem 4
Find all employees' current department and the start date with their employee
number and sort the result by employee number. The result of query is similar
to following table:</br>
emp_no dept_name from_date</br>
10001 Development 1986-06-26</br>
10002 Sale 1996-08-03</br>
10003 Production 1995-12-03</br>
...</br>
### 2.5 Problem 5
List the number of employees in each department. Sort the result by department
name. The result of query is similar to following table:</br>
dept_name noe</br>
Customer Service 23580</br>
Development 85707</br>
...</br>
### 2.6 Problem 6
List pairs of employee (e1; e2) which satisfies ALL following conditions:</br>
1. Both e1 and e2's current deparmnet number is d001.</br>
2. The year of birthdate for e1 and e2 is 1955.</br>
3. The e1's employee number is less than e2.</br>
Sort the result by e1 then e2. The result of query is similar to following table:</br>
e1 e2</br>
10239 10367</br>
10239 11251</br>
...</br>
10367 11251</br>
10367 11554</br>
...</br>
### 2.7 Problem 7
For each department, list out the manager who stayed the longest time in the
department. The list needs to exclude the current manager. Sort the result by
employ number. The result of query is similar to following table:</br>
emp_no dept_name</br>
110022 Marketing</br>
110085 Finance</br>
...</br>
### 2.8 Problem 8
Find out departments which has changed its manager more than once then list
out the name of the departments and the number of changes. Sort the result
by department name. The result of query is similar to following table:</br>
dept_name cnt</br>
Customer Service 3</br>
...
### 2.9 Problem 9
For each employee, and out how many times the title has been changed without
chaning of the salary. e.g. An employee promoted from Engineer to Sr. Engineer
with salaries remains 10k. Sort the result by employ number. The result of query
is similar to following table:</br>
emp_no cnt</br>
10004 1</br>
10005 1</br>
10007 1</br>
10009 2</br>
...</br>
### 2.10 Problem 10
Find out those pairs of employees (eH; eL) which satisfy ALL following condi-
tions:</br>
1. Both eH and eL born in 1965</br>
2. eH's current salary is higher than eL's current salary</br>
3. eH's hiring date is greater than eL, which means eH is a newer employee
than eL.</br>
Sort the result by employee number of eH then employee number of el.</br>
Result is shown as table below:</br>
h_empno h_salary h_date l_empno l_salary l_date</br>
10095 80955 1986-07-15 17206 55078 1986-02-25</br>
10095 80955 1986-07-15 18617 66957 1986-06-28</br>
...</br>
 h empno : eH's employee number</br>
 h salary : eH's current salary</br>
 h date : eH's hire date</br>
 l empno : eL's employee number</br>
 l salary : eL's current salary</br>
 l date : eL's hire date</br>
### 2.11 Problem 11
Find the employee with highest current salary in each department. Note that
MAX function is not allowed. Sort the result by department name. Result is
shown as table below:</br>
dept_name emp_no salary</br>
Customer Service 18006 144866</br>
Development 13386 144434</br>
...</br>
### 2.12 Problem 12
Calculate the percentage of number of employees' current salary is above the
department current avarage. Sort the result by department name. The result
is shown as following:</br>
dept_name above_avg_pect</br>
Customer Service 44.4988</br>
Development 46.6018</br>
...</br>
As the figure shows, there are 51.9825 % employees in Development department
has their current salary above the average of current salary in Development
department.</br>
### 2.13 Problem 13
Assuming a title is a node and a promotion is an edge between nodes. e.g.
And promotion from Engineer to Senior Engineer means their is a path from
Node 'Engineer' to Node 'Senior Engineer'.</br> Find out pairs of node of source
and destination (src, dst) which there is no such path in the database. Sort the
result by src then dst. The result is shown as following:</br>
src dst</br>
Assistant Engineer Assistant Engineer</br>
Engineer Assistant Engineer</br>
...</br>
The result table shows that there is no path from Assistant Engineer to Assistant
Engineer and neither Engineer to Assistant Engineer. That means there is no
one have been from Engineer and be promoted/demoted to Assistant Engineer
(no matter how many times of promotion/demotion) in the database.</br>
### 2.14 Problem 14
Continued from problem 13, assuming we treat the years from beginning of a
title until promotion as the distance between nodes. e.g. An employee started as
an Assistant Engineer from 1950-01-01 to 1955-12-31 then be promoted to En-
gineer on 1955-12-31. Then there is an edge between node "Assistant Engineer"
to "Engineer" with distance 6.</br>
Calculate the average distance of all possible pair of titles and ordered by
source node. To simplify the problem, there is no need to consider months and
date when calculating the distance. Only year is required for calculating the
distance. Besides, we can assume the distances of any given pair is less than
100.</br>
Sort the result by src then dst. The expected result is shown as follow:</br>
src dst years</br>
Assistant Engineer Engineer 7.7926</br>
Assistant Engineer Manager 20.5266</br>
...</br>
Engineer Manager 12.7340</br>
...</br>
As the table shows, the average distance between node "Assistant Engineer" and
node "Engineer" is 7.7926. We add it with the distance between "Engineer"
to "Manager", which is 12.7340, to find out the distance between "Assistant
Engineer" to "Manager" is 20.5266.</br>
