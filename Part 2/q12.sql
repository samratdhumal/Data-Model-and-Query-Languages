WITH
 
t1 as
(
select cde.dept_no, avg(s.salary) as avgsal
from salaries s, current_dept_emp cde
where s.emp_no = cde.emp_no
and year(s.to_date) = 9999
group by cde.dept_no),


t2 as
(
select dept_no, count(*) as tot 
from current_dept_emp
where year(to_date) = 9999
group by dept_no
)


select d.dept_name as dept_name,(count(s.emp_no)*100)/t2.tot as above_avg_pect
from t1, t2, departments d, salaries s, current_dept_emp cde
where cde.emp_no = s.emp_no
and d.dept_no = t1.dept_no
and cde.dept_no = d.dept_no
and d.dept_no = t2.dept_no
and year(s.to_date) = 9999
and year(cde.to_date) = 9999
and s.salary > t1.avgsal
group by d.dept_no
order by d.dept_name
;