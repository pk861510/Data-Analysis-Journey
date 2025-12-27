with base as(
  select
  videoDurationBucket
  ,count(videoId) as videoCount
  from `youtube_project.youtube_fact`
  where channelId = "UCNU_lfiiWBdtULKOw6X0Dig"
  group by 1
)
select *
  ,concat( round(base.videoCount * 100 /(select sum(videoCount) from base),1),"%") as videoPercent
from base