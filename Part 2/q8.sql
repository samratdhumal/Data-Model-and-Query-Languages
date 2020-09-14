select d.dept_name, count(m.dept_no)-1 as cnt
from dept_manager m, departments d
where d.dept_no = m.dept_no
group by m.dept_no
having cnt>1
order by d.dept_name
;