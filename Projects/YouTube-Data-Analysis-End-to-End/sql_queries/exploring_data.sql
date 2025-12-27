
--checking the overall data for null and data itself
-- select * FROM `youtube_project.all_youtube_videos_metadata`;


-- select video_id from `youtube_project.all_youtube_videos_metadata`
-- where video_id is  null;

-- select * FROM `youtube_project.channel_list`;
-- select * FROM `youtube_project.channel_metadata`;
-- select * FROM `youtube_project.all_youtube_video` limit 10;
-- select * FROM `youtube_project.all_youtube_video_status` limit 10;
-- select * FROM `youtube_project.all_youtube_videos_metadata`limit 10;


-- remove the extra duplicate video_id 
-- CREATE OR REPLACE TABLE `youtube_project.all_youtube_videos_metadata` AS
-- SELECT * EXCEPT(row_num)
-- FROM (
--     SELECT *,
--            ROW_NUMBER() OVER (PARTITION BY video_id ORDER BY video_id) as row_num
--     FROM `youtube_project.all_youtube_videos_metadata`
-- )
-- WHERE row_num = 1;


-- first row remove and change header name 
-- CREATE OR REPLACE TABLE `youtube_project.channel_list` AS
-- SELECT
--   string_field_0 AS channel_id,
--   string_field_1 AS channel_name,
--   string_field_2 AS channel_url
-- FROM `youtube_project.channel_list`
-- WHERE string_field_0 != 'channel_id';
