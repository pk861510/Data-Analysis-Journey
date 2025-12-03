with base as (
  SELECT 
  mpsno,
  memberName
  ,count(case when isPresent = True then 1 end ) * 100 / count(*) perTotal

  from lok_sabha.lok_sabha_fact
  where lok_sabha = 17
  group by 1,2
  order by 3 desc)

select *from base
where perTotal <75;