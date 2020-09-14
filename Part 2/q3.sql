select last_name, salary, from_date, to_date 
from employees, salaries
where employees.emp_no = salaries.emp_no
order by employees.last_name,
	salaries.salary,
	salaries.from_date,
    salaries.to_date
;