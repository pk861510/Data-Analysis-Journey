-- Top 10 Viewed Video
select *
from `youtube_project.youtube_fact`
where channelId = "UCNU_lfiiWBdtULKOw6X0Dig"
order by videoView desc
limit 10;