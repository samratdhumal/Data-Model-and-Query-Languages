select dept_name, COUNT(*) AS noe
from departments left join dept_emp 
ON dept_emp.dept_no = departments.dept_no
group by dept_name
;