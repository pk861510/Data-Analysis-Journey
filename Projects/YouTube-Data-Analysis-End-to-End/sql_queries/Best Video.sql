-- What is the Best/Outlier Video
select videoId
  ,videoPublishedAt
  ,videoView
  ,videoLike
  ,videoComment
  ,videoTitle
  ,round(videoView / date_diff(current_date, date(videoPublishedAt), day)) as viewPerDay
from `youtube_project.youtube_fact`
where channelId = "UCNU_lfiiWBdtULKOw6X0Dig"
order by viewPerDay desc
