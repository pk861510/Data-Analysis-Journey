with base as(
select 
profession
,count(distinct mpsno) as totalMPs

from lok_sabha.members
where profession is not null
group by 1)

select * 
,dense_rank() over(order by totalMPs desc) mpShare
from base;
