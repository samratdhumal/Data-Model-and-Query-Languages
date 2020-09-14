# Data Model and Query Languages
## Technology Used: MySQL, XML (XQuery)
##    Determined a full-scale model for a University and an Employment system dataset and developed the database using MySQL. Queried XML dataset using XQuery on books dataset to determine different relations in the dataset. 

### The Project is divided in three parts. Each part has a separate README file for reference.


## PART1 - "TINYHUB: A Course Enrollment Website”
TinyHub is a database system created to maintain the details of the students, professors, departments, programs, courses offered and grades.
Main functions of TinyHub are:
• User management: User sign up, user login/logout.
• Department management: Department functionality.
• Course management: Course and the pre-requisites functionality.
• Student-Course management: Register/ enroll for a course, provide feedback


### E/R Schema:
The Entity Relationship diagram for the ‘TinyHub’ database provides the visualization the data flow across various entities.is shown below:

<p align="center">
<img src="https://github.com/samratdhumal/Tabular-methods-for-Multiagent-RL/blob/master/Images/1.JPG" width="750">
</p>


### Tables: 
The tables created to accomplish the requirements are according to order of execution:
•	User
•	Account
•	Student
•	Professor
•	Instructor
•	Staff
•	Department
•	CourseList
•	Feedback
•	Program
•	TeachingAssistant
•	Semester
•	Course
•	Exams
•	Prerequisite


### Functions: 
The system is executed in four stages:

### 1.	User Management:
•	The ‘USER’ entity set refers to all the members enrolled in the university. The Users can be broadly classified as entities – STUDENT, PROFESSOR and STAFF (described with a ISA relationship) with each of them requiring signing up to their accounts using their respective email address which is unique to each user. 
•	The USER entity has attributes `User_ID`, `User_Name`, `Start_Date`, `End_Date`, `Access_Level`. The User ID is primary key.
•	The Access_Level helps to identify what type of access the user has. We have have 3 access levels as per our type of users.
•	The USER is connected with an ACCOUNT entity with a ‘Has A’ relationship.
•	The ACCOUNT entity has attributes `User_ID`, `Display_Name`, `Email_ID`, `Password`, `Account_Status`. As per the Instructions the Email ID is a Unique and Primary key, The User_ID, display name are also unique.

### 2.	Department management:
•	The department management includes the various departments, the professors/staff enrolled in a department, programs offered by each department.
•	The STUDENT entity has attributes `Student_ID`, `Department_No`, `Grade_List`, `Course_ID_List`, `Semester_ID`. The Student_ID is the primary key derived from User_Id. The Dept_No, Semester_ID are Foreign Keys. The C_ID list stores the list of courses the student has taken.
•	In this section the PROFFESSOR and STAFF are connected to DEPARTMENT using ‘Hired by’ relationship and one to many cardinality implying that both are hired by one department.
•	The PROFESSOR table has attributes `Student_ID`, `Department_No`, `Grade_List`, `Semester_ID`. These attributes help them connect with department and semester tables.
•	The STAFF table is also derivation of the USER table which has attributes as `Staff_ID`, `Dep_No`.
•	The DEPARTMENT table has attributes `Dept_No` and `Department_Name’.
•	STUDENT is joined to DEPARTMENT by many-to-many ‘Majors In’ relationship, showing that the student can major in different departments.
•	DEPARTMENT and PROGRAM are considered as one entity by putting an aggregation box. The aggregation here shows that the STUDENT can Opt for multiple programs but he must major in the DEPARTMENT which offers that program.


### 3.	Course management:
•	This section focuses on the courses offered by the department, pre-requisites if any, when the courses may be opted for (which semester), the teaching assistants for each course. 
•	The COURSE entity has multiple attributes as mentioned in the ER.
•	Here STUDENT ‘Registers’ in SEMESTER with one to many relation showing that that one student can register in multiple semesters. Each DEPARTMENT ‘Has’ multiple COURSES is shown in one to many relation.
•	The TEACHING ASSISTANT entity is derived from the STUDENT and the INSTRUCTOR entity is derived from the PROFESSOR.COURSE entity is connected to itself with many to many cardinality using PREREQUISITE relationship.
•	The INSTRUCTOR has COURSE_LIST multivariate attribute which is treated as new table and the details of the courses the instructor teaches are stored here.
•	Also the prerequisite courses are shown by self-joining the course by ‘Prerequisite’ relationship.


### 4.	Student-Course management:
•	Here the details pertaining to each course, the grades obtained on the exam, feedback provided to the professors. 
•	The aggregation is used for SEMESTER and COURSE showing that anyone must register in semester first before enrolling in any course.
•	The capacity can be checked using the ‘Capacity’ attribute in the COURSE entity. Grades are stored in the ‘Grades’ attribute.
•	The Self relation of COURSE using PREREQUISTE shows that the student should pass all the prerequisite courses. 
•	Also the PROFESSOR has the FEEDBACK multivariate attribute for which we have created a new table wherein the feedbacks given to the professor are stored.
•	EXAMS is entity where the number of exams, number of problems per exam and grades of each problem are stored. Using all the grades of problem and number of exams total grade of the course is stored in the ‘Grades’ attribute in the COURSE entity. Exam has composite attributes for no of problems and grades.
•	The COURSE is connected to DEPARTMENT using ‘Has A’ relationship showing that the department must have that course. 

The SQL EER diagram is as below:
<p align="center">
<img src="https://github.com/samratdhumal/Tabular-methods-for-Multiagent-RL/blob/master/Images/1.JPG" width="750">
</p>



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



## PART3 - "Book Management(XQuery)”

### 1.1 Find the names of all Jeff’s co-authors and list them together with the titles of books that were coauthored.
Sample output format:
<book>
<title>Big data analytics</title>
<name>Jeff</name>
<name>the other author</name>
</book>
……
### 1.2 Return all the author pairs who have co-authored two or more books together, list their co-authored
books’ information.
Sample output format:
<coauthor>
<output>
<name>author1</name>
<name>author2</name>
<book year="the book year">
<title>the book title</title>
<category>the book category</category>
<rating>the book rating</rating>
<price>the book price</price>
</book>
</output>
<output>
<name>author1</name>
<name>author2</name>
<book year="the book year">
<title>the book title</title>
<category>the book category</category>
<rating>the book rating</rating>
<price>the book price</price>
</book>
</output>
......
</coauthor>
……
### 1.3 Find the average book price of each category and global. If a category has higher than global average
book price, list one most expensive book and its authors, for each of those categories.
Sample output format:
<result>
<categories>
<output>
<category>DB</category>
<title>Database systems</title>
<price>1000</price>
<name>author1</name>
<name>author2</name>
<name>……</name>
</output>
</categories>
......
</result>
### 1.4 Return all the book price and rating with book name and sort the price and rating from high to low
separately.
Sample output format 1.4a:
<title>Applied Mathematics</title>
<price>100</price>
<title>Introduction to R programming<title/>
<price>200</price>
<title>Introduction to Python<title/>
<price>300</price>
<title>Big data analytics<title/>
<price>400</price>
…
Sample output format 1.4b:
<title>Applied Functional Analysis</title>
<rating>2</rating>
<title>Applied Mathematics</title>
<rating>2.1</rating>
<title>AWS: Security Best Practices on AWS</title>
<rating>2.7</rating>
<title>Introduction to R programming</title>
<rating>3.2</rating>
<title>Big data analytics</title>
<rating>3.5</rating>
…
  
### 1.5 The text book requirement in this class is based on ‘category’: one ‘DB’, one ‘PL’, one ‘Science’, one
‘Others’. Return your plan for the book purchasing. The plan should follow some second rules (cheapest (1),
best rating (1), assume you have $1800 how to get the best rating books (2))
Sample output format 1.5a:
<title>Big data analytics</title>
<price>400</price>
<category>DB</category>
<title>Applied Functional Analysis</title>
<price>400</price>
<category>Others</category>
<title>Introduction to R programming</title>
<price>200</price>
<category>PL</category>
<title>Applied Mathematics</title>
<price>100</price>
<category>Science</category>
Sample output format 1.5b:
<title>Database systems</title>
<rating>5</rating>
<category>DB</category>
<title>Pattern Recognition</title>
<rating>5</rating>
<category>Others</category>
<title>Introduction to Python</title>
<rating>4.7</rating>
<category>PL</category>
<title>Statistical Inference</title>
<rating>5</rating>
<category>Science</category>

### 1.6 Define a DTD for an equivalent DTD data format B which stores the same information as A, but in
which the authors are listed under their books. Write an XQuery query whose input is an XML document valid
with respect to the DTD A and whose output is another XML document valid with respect to B.
