select distinct t.emp_no as emp_no, count(*) as cnt 
from titles t
where t.from_date not in 

(select s.from_date 
	from salaries s
	where t.emp_no = s.emp_no)
    
group by t.emp_no
order by t.emp_no
;