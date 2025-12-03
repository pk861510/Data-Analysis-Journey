
create or replace table lok_sabha.lok_sabha_fact as

WITH attendance_data as
  (SELECT lok_sabha
    ,session
    ,dateOfAttendance
    ,cast(mpsno as int) mpsno
    ,division
    ,memberName
    ,attendanceStatus
    ,CASE WHEN attendanceStatus = "S" THEN "Member signed"
      WHEN attendanceStatus = "S*" THEN "Signed through Mobile"
      WHEN attendanceStatus = "S#" THEN "Signed both Register and Mobile"
      WHEN attendanceStatus = "NR" THEN "Not required"
      WHEN attendanceStatus = "NS" THEN "Member Did not Signed"
      WHEN attendanceStatus = "NS@" THEN "Member present but forgot to sign"
      end as attendanceCTG
    ,CASE WHEN attendanceStatus in ("S","S*","S#","NS@") THEN True
      WHEN attendanceStatus in("NS") THEN False end as isPresent
  FROM lok_sabha.attendance)
 

,members as 
    (select * from lok_sabha.members)

SELECT attendance_data.* 
  ,members.mpLastFirstName
  ,members.profession
  ,members.profession2
  ,members.qualification
  ,members.maritalStatus
  ,members.noOfTerms
  ,age
  ,dob
  ,date_diff(dateOfAttendance,dob,year) as calculatedAge
  ,members.stateName
  ,members.partySname
  ,members.partyFname
  ,members.gender
FROM attendance_data
left join 
members
on attendance_data.mpsno = members.mpsno



