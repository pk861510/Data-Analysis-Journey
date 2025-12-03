create or replace table lok_sabha.attendance as
with base as
  (SELECT lok_sabha
  ,session
  ,dateOfAttendance
  ,attendance_data
  FROM analyze-csv.lok_sabha.attendance,
  unnest(JSON_EXTRACT_ARRAY(member_level_attendance)) as attendance_data)
select *
,JSON_EXTRACT_SCALAR(attendance_data ,'$.mpsno') mpsno
,JSON_EXTRACT_SCALAR(attendance_data, '$.memberName') memberName
,JSON_EXTRACT_SCALAR(attendance_data, '$.attendanceStatus') attendanceStatus
,JSON_EXTRACT_SCALAR(attendance_data, '$.division') division
from base


-- 1048(count before unnest)
-- select count(*) from lok_sabha.attendance
-- select count(*) from base
-- 195844(count after unnnest)-Each session each date attnadence