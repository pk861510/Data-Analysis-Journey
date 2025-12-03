select distinct lok_sabha 
,mpsno
,memberName
from `lok_sabha.lok_sabha_fact`
where ispresent is null
