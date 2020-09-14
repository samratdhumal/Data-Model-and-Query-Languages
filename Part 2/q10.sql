select h.h_empno, h.h_salary, h.h_date, l.l_empno, l.l_salary, l.l_date from
(select e.emp_no h_empno, s.salary h_salary, e.hire_date h_date from employees e, salaries s
where e.emp_no = s.emp_no
and year(e.birth_date) = 1965
and year(s.to_date) = 9999) h

join

(select e.emp_no l_empno, s.salary l_salary, e.hire_date l_date from employees e, salaries s
where e.emp_no = s.emp_no
and year(e.birth_date) = 1965
and year(s.to_date) = 9999) l

where h.h_salary > l.l_salary
and h.h_date > l.l_date
order by h_empno, l_empno
;