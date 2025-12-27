create or replace table  `youtube_project.youtube_fact` as(
  with base as(
    select * from `youtube_project.channel_list`
  )
  ,channel_metadata as (
    select * from
    `youtube_project.channel_metadata`
  )
  ,youtube_videos as (
    select * from youtube_project.all_youtube_video
  )
  ,youtube_videos_metadata as(
    select * from `youtube_project.all_youtube_videos_metadata`
  )
  ,youtube_video_status as (
    select * from `youtube_project.all_youtube_video_status`
  )
  ,final as (select base.channel_id as channelId
    ,channel_metadata.channel_title as channelTitle
    ,youtube_videos.video_id as videoId
    ,youtube_videos.title as videoTitle
    ,youtube_videos.published_at as videoPublishedAt
    ,youtube_videos_metadata.video_duration as videoDuration
    ,youtube_video_status.video_views as videoView
    ,youtube_video_status.video_likes as videoLike
    ,youtube_video_status.video_comments as videoComment
    ,youtube_videos_metadata.video_quality as videoQuality
    ,youtube_videos.description as videoDescription
    ,channel_metadata.channel_desc as channelDescription
    ,channel_metadata.subscriber_count as subscriberCount
    ,channel_metadata.video_count as videoCount
    ,channel_metadata.channel_published_at as channelPublishedAt
    ,base.channel_url as url
    from base
    left join channel_metadata on base.channel_id = channel_metadata.channel_id
    left join youtube_videos on youtube_videos.cnannel_id = base.channel_id
    left join youtube_videos_metadata on youtube_videos.video_id = youtube_videos_metadata.video_id
    left join youtube_video_status on youtube_video_status.video_id = youtube_videos.video_id
  )
  select *
  ,case when time_diff(final.videoDuration,"00:00:00",second) is null then "0.NA"
  when time_diff(final.videoDuration,"00:00:00",second) < 60 then "l. Short (<1 min)"
  when time_diff(final.videoDuration,"00:00:00",second) < 300 then "2. Medium (1-5 min)"
  when time_diff(final.videoDuration,"00:00:00",second) < 900 then "3. Long (5-15 min)"
  when time_diff(final.videoDuration,"00:00:00",second) < 1800 then "4. Extended(15-30 min)"
  else "5. Very long (30+ min)"
  end as videoDurationBucket
  from final
)

