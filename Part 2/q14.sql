WITH 
recursive cte_query1(src, dst, years, distance) as

(
select DISTINCT t1.title as src, t2.title as dst, avg(1 + year(t1.to_date) - year(t1.from_date)) AS years, 0
from titles t1, titles t2
where t1.emp_no = t2.emp_no 
and t1.title != t2.title
and t1.to_date = t2.from_date 
group by src, dst
order by src, dst
),

cte_query2(src, dst, years, distance) as

(
select * from 

(
select DISTINCT t1.title as src, t2.title as dst, avg(1 + year(t1.to_date) - year(t1.from_date)) AS years, 0
from titles t1, titles t2
where t1.emp_no = t2.emp_no 
and t1.title != t2.title
and t1.to_date = t2.from_date 
group by src, dst
order by src, dst
) cte_query1

union

select cq2.src, cq1.dst,( cq1.years + cq2.years) as years, (cq2.distance+1) as distance 
from cte_query1 cq1
INNER JOIN 
cte_query2 cq2
ON cq1.src = cq2.dst 
AND cq2.distance < 3)


select cte_query2.src AS src, cte_query2.dst AS dst, MIN(cte_query2.years) as years 
from cte_query2
where cte_query2.src != cte_query2.dst
group by src, dst
order by src, dst
;