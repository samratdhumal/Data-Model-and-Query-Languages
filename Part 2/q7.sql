select dm.emp_no as emp_no, d.dept_name as dept_name
from dept_manager dm, departments d
where datediff(to_date,from_date) in
(
select min(-1*datediff(to_date,from_date))*-1 
FROM dept_manager
where year(to_date)< 9999
group by dept_no
)
and dm.dept_no = d.dept_no
order by dm.emp_no
;
