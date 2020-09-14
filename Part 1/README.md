## PART1 - "TINYHUB: A Course Enrollment Website”
TinyHub is a database system created to maintain the details of the students, professors, departments, programs, courses offered and grades.</br>
Main functions of TinyHub are:</br>
• User management: User sign up, user login/logout.</br>
• Department management: Department functionality.</br>
• Course management: Course and the pre-requisites functionality.</br>
• Student-Course management: Register/ enroll for a course, provide feedback</br>


### E/R Schema:
The Entity Relationship diagram for the ‘TinyHub’ database provides the visualization the data flow across various entities.is shown below:</br>

<p align="center">
<img src="https://github.com/samratdhumal/Data-Model-and-Query-Languages/blob/master/Part%201/ER_DMQL.png" width="750">
</p>


### Tables: 
The tables created to accomplish the requirements are according to order of execution:</br>
•	User</br>
•	Account</br>
•	Student</br>
•	Professor</br>
•	Instructor</br>
•	Staff</br>
•	Department</br>
•	CourseList</br>
•	Feedback</br>
•	Program</br>
•	TeachingAssistant</br>
•	Semester</br>
•	Course</br>
•	Exams</br>
•	Prerequisite</br>


### Functions: 
The system is executed in four stages:

#### 1.	User Management:
•	The ‘USER’ entity set refers to all the members enrolled in the university. The Users can be broadly classified as entities – STUDENT, PROFESSOR and STAFF (described with a ISA relationship) with each of them requiring signing up to their accounts using their respective email address which is unique to each user. </br>
•	The USER entity has attributes `User_ID`, `User_Name`, `Start_Date`, `End_Date`, `Access_Level`. The User ID is primary key.</br>
•	The Access_Level helps to identify what type of access the user has. We have have 3 access levels as per our type of users.</br>
•	The USER is connected with an ACCOUNT entity with a ‘Has A’ relationship.</br>
•	The ACCOUNT entity has attributes `User_ID`, `Display_Name`, `Email_ID`, `Password`, `Account_Status`. As per the Instructions the Email ID is a Unique and Primary key, The User_ID, display name are also unique.</br>

#### 2.	Department management:
•	The department management includes the various departments, the professors/staff enrolled in a department, programs offered by each department.</br>
•	The STUDENT entity has attributes `Student_ID`, `Department_No`, `Grade_List`, `Course_ID_List`, `Semester_ID`. The Student_ID is the primary key derived from User_Id. The Dept_No, Semester_ID are Foreign Keys. The C_ID list stores the list of courses the student has taken.</br>
•	In this section the PROFFESSOR and STAFF are connected to DEPARTMENT using ‘Hired by’ relationship and one to many cardinality implying that both are hired by one department.</br>
•	The PROFESSOR table has attributes `Student_ID`, `Department_No`, `Grade_List`, `Semester_ID`. These attributes help them connect with department and semester tables.</br>
•	The STAFF table is also derivation of the USER table which has attributes as `Staff_ID`, `Dep_No`.</br>
•	The DEPARTMENT table has attributes `Dept_No` and `Department_Name’.</br>
•	STUDENT is joined to DEPARTMENT by many-to-many ‘Majors In’ relationship, showing that the student can major in different departments.</br>
•	DEPARTMENT and PROGRAM are considered as one entity by putting an aggregation box. The aggregation here shows that the STUDENT can Opt for multiple programs but he must major in the DEPARTMENT which offers that program.</br>


#### 3.	Course management:
•	This section focuses on the courses offered by the department, pre-requisites if any, when the courses may be opted for (which semester), the teaching assistants for each course. </br>
•	The COURSE entity has multiple attributes as mentioned in the ER.</br>
•	Here STUDENT ‘Registers’ in SEMESTER with one to many relation showing that that one student can register in multiple semesters. Each DEPARTMENT ‘Has’ multiple COURSES is shown in one to many relation.</br>
•	The TEACHING ASSISTANT entity is derived from the STUDENT and the INSTRUCTOR entity is derived from the PROFESSOR.COURSE entity is connected to itself with many to many cardinality using PREREQUISITE relationship.</br>
•	The INSTRUCTOR has COURSE_LIST multivariate attribute which is treated as new table and the details of the courses the instructor teaches are stored here.</br>
•	Also the prerequisite courses are shown by self-joining the course by ‘Prerequisite’ relationship.</br>

#### </br>4.	Student-Course management:
•	Here the details pertaining to each course, the grades obtained on the exam, feedback provided to the professors.</br> 
•	The aggregation is used for SEMESTER and COURSE showing that anyone must register in semester first before enrolling in any course.</br>
•	The capacity can be checked using the ‘Capacity’ attribute in the COURSE entity. Grades are stored in the ‘Grades’ attribute.</br>
•	The Self relation of COURSE using PREREQUISTE shows that the student should pass all the prerequisite courses. </br>
•	Also the PROFESSOR has the FEEDBACK multivariate attribute for which we have created a new table wherein the feedbacks given to the professor are stored.</br>
•	EXAMS is entity where the number of exams, number of problems per exam and grades of each problem are stored. Using all the grades of problem and number of exams total grade of the course is stored in the ‘Grades’ attribute in the COURSE entity. Exam has composite attributes for no of problems and grades.</br>
•	The COURSE is connected to DEPARTMENT using ‘Has A’ relationship showing that the department must have that course. </br>

The SQL EER diagram is as below:</br>
<p align="center">
<img src="https://github.com/samratdhumal/Data-Model-and-Query-Languages/blob/master/Part%201/EER_diag.png" width="750">
</p>

