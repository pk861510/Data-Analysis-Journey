
-- What is the usual Durations of videos he posts
-- Best Month(no of views,no of posts)
-- best performing month
with base as(
  select
  date(date_trunc(videoPublishedAt, month)) as videoPublishedMonth
  ,count(*) as videoCount
  ,sum(videoView) as totalViews
  from `youtube_project.youtube_fact`
  where channelId = "UCNU_lfiiWBdtULKOw6X0Dig"
  group by 1
)
select *
  ,concat( round(base.videoCount * 100 /(select sum(videoCount) from base),1),"%") as videoPercent
  ,dense_rank() over(order by videoCount desc) as videoRank
  ,dense_rank() over(order by base.totalViews desc) as viewRank
  ,round(totalViews/videoCount) as perVideoView
from base
where videoCount>5
order by perVideoView desc,base.videoPublishedMonth desc
