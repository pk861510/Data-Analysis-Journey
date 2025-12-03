-- select lok_sabha
-- ,session
-- -- ,dateOfAttendance
-- ,count(*) as TotalMPs
-- ,count(case when isPresent = True then 1 end) as IgnorNA
-- ,count(case when isPresent = True then 1 end)/count(*) perMPsPresent

-- from lok_sabha.lok_sabha_fact
-- group by 1,2
-- order by 1,2
-- ;

-- select lok_sabha
-- ,session
-- ,count(case when isPresent = True then 1 end) as TotalMPs
-- ,dateOfAttendance

-- from lok_sabha.lok_sabha_fact
-- group by 1,2,4
-- order by 1,2,4;


select mpsno,memberName
,COUNT(case when isPresent = True then 1 end) * 100 /count(*)  TotalMpsATT

from lok_sabha.lok_sabha_fact
group by 1,2
order by TotalMpsATT desc
limit 5;







