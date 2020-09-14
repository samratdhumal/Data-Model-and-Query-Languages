WITH 

recursive cte_query as

(WITH 
r_table1 as (select emp_no, title, to_date from titles)

select distinct t1.title as src, t2.title as dst 
from r_table1 t1 join r_table1 t2 
using(emp_no)
where t1.to_date < t2.to_date 
group by src, dst

union

select cq.src, r_table3.dst

from

(WITH 
r_table2 as (select emp_no,title,to_date from titles)

select distinct t1.title as src,t2.title as dst 
from r_table2 t1 join r_table2 t2 
using(emp_no)
where t1.to_date < t2.to_date 
group by src,dst) r_table3

inner join cte_query cq

on cq.dst = r_table3.src
)


select table2.src as src, table2.dst as dst

from

(select * 
from cte_query
group by src, dst) table1

right join

(with sj_table as (select distinct title 
				   from titles)
	select t1.title as src, t2.title as dst
	from sj_table t1 join sj_table t2 
) table2

ON
table1.src = table2.src 
and table1.dst = table2.dst
where table1.src is null
order by src, dst
;