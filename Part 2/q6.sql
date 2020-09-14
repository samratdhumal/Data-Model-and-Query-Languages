select nt1.e1, nt2.e2

from
 
(select employees.emp_no as e1 
from employees, dept_emp
where dept_emp.emp_no = employees.emp_no
and year(employees.birth_date) = 1955
and dept_emp.dept_no = 'd001'
and year(dept_emp.to_date)= 9999
order by e1) nt1

join

(select employees.emp_no as e2 
from employees, dept_emp
where dept_emp.emp_no = employees.emp_no
and year(employees.birth_date) = 1955
and dept_emp.dept_no = 'd001'
and year(dept_emp.to_date)= 9999
order by e2) nt2

where nt1.e1 < nt2.e2
;
