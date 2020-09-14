WITH 

t1 as (select min(salary*(-1))*-1 as t1_sal, d.dept_no
		   from  salaries s, dept_emp d
		   where year(s.to_date) = 9999
	       and s.emp_no = d.emp_no
		   group by d.dept_no),
           
t2 as (select s.emp_no, d.dept_no, s.salary 
		 from dept_emp d
         inner join salaries s 
         on s.emp_no = d.emp_no),

t3 as (select t2.emp_no, t2.salary, t2.dept_no
			from t1 inner join t2
			on t1.t1_sal = t2.salary
			and t1.dept_no = t2.dept_no)

select d.dept_name,t3.emp_no, t3.salary
from 
t3
inner join 
departments d
on t3.dept_no = d.dept_no
order by d.dept_name
;

