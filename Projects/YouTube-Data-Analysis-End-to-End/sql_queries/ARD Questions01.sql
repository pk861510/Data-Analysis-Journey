-- select * from `youtube_project.youtube_fact`;

-- 1. Total Subscriber Count
select 
channelTitle
,max(subscriberCount) as channelSubscriberCount
,max(channelViewCount) as channelViewCount
,max(channelVideoCount) as channelVideoCount
,round(max(channelViewCount)/count(videoId),1) avgViewPerVideo
,time_add("00:00:00"
,interval cast(avg(time_diff(videoDuration,"00:00:00",second)) as int64) second) as avgDuration
from `youtube_project.youtube_fact`
group by 1

