select lok_sabha
,partyFname
,count(distinct mpsno) as TotalMPs
,count(case when isPresent = True then 1 end) * 100/ count(*) perMPsPersent
from `lok_sabha.lok_sabha_fact`

group by 1,2
order by 1,3 desc
