with base as (
select 
profession
,count(*) as totalMPs
,count(case when isPresent = True then 1 end) * 100 /count(*) perAttendance
from lok_sabha.lok_sabha_fact
where isPresent is not null
group by 1
order by 3 desc)

select * from base;