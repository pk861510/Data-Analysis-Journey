select lok_sabha
,session
-- ,dateOfAttendance
-- ,count(*) as TotalMPs
,count(case when isPresent = True then 1 end) * 100/ count(*) perMPsPersent
from `lok_sabha.lok_sabha_fact`
where isPresent is not null -- We Do not consider the NR

group by 1,2
order by 1,2
