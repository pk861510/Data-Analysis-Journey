create or replace table lok_sabha.session_data as
with base as
(SELECT 
session
,dateOfAttendance
,api_data,
FROM `analyze-csv.lok_sabha.session_data`)

SELECT * 
,JSON_EXTRACT_SCALAR(api_data,'$.presentCount') presentCount
,JSON_EXTRACT_SCALAR(api_data, '$.absentCount') absentCount
from base