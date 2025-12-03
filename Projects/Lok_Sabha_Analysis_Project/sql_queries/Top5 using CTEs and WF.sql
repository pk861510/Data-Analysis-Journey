with base as 
  (select lok_sabha
  ,partyFname
  ,memberName
  ,COUNT(case when isPresent = True then 1 end) * 100 /count(*) as PerAttendance
  from lok_sabha.lok_sabha_fact
  where isPresent is not null
  group by 1,2,3
  order by 1,PerAttendance desc)

select *
,dense_rank() over(partition by lok_sabha order by PerAttendance desc) as OverallRank
,dense_rank() over(partition by lok_sabha,partyFname order by PerAttendance desc) PartyRank

from base where partyFname in ("Bharatiya Janata Party","Indian National Congress")
qualify PartyRank <=5;

-- -- if we do not want to show dense rank and also want filter the data the we use qualift (dense rank ) condition
-- with base as 
--   (select lok_sabha
--   ,partyFname
--   ,memberName
--   ,COUNT(case when isPresent = True then 1 end) * 100 /count(*) as PerAttendance
--   from lok_sabha.lok_sabha_fact
--   group by 1,2,3
--   order by 1,PerAttendance desc)

-- select *
-- from base where partyFname in ("Bharatiya Janata Party")
-- qualify dense_rank() over(partition by lok_sabha,partyFname order by PerAttendance desc) <=1;



