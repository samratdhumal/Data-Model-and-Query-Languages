select de.emp_no, d.dept_name, de.from_date
from departments d, dept_emp de
where d.dept_no = de.dept_no
and year(de.to_date)= 9999
order by de.emp_no;