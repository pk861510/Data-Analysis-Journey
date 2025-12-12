import os
import re
import pandas as pd
from datetime import timedelta
from dotenv import load_dotenv
from googleapiclient.discovery import build

# this is for fetching the sensitive information from the .env(environment varible) for security purppose
load_dotenv()

api_key = os.getenv('api_key')
# Building and calling the youtube api service
youtube = build('youtube', 'v3',developerKey = api_key)

hours_pattern = re.compile(r"(\d+)H") 
minutes_pattern = re.compile(r"(\d+)M")
seconds_pattern = re.compile(r"(\d+)S")

nextPageToken = None
videoSeconds = 0

while True:

    pl_request = youtube.playlistItems().list(
    part =  'contentDetails'
    ,pageToken = nextPageToken
    ,maxResults = 50
    ,playlistId = 'PL-osiE80TeTt2d9bfVyTiXJA-UTHn6WwU')

    pl_response = pl_request.execute()
    value =  pl_response

    vid_id = []

    for item in pl_response["items"]:
        vid_id.append(item['contentDetails']['videoId'])

        # print(item['contentDetails']['videoId'])
        # print() #form new line between
    # print(vid_id)
    # vid_id = ','.join(vid_id)   # make video id by comma seperated
    # print(vid_id)

    vid_request = youtube.videos().list(
        part = 'contentDetails',
        id = ','.join(vid_id)
    )
    vid_response = vid_request.execute()
    # print(vid_response)

    for item in vid_response['items']:
        duration = item['contentDetails']['duration']
        hours = hours_pattern.search(duration) 
        minutes = minutes_pattern.search(duration)
        seconds = seconds_pattern.search(duration)

        hours = int(hours.group(1)) if hours else 0 #if hours in video the it work o/w assign hour to 0
        minutes = int(minutes.group(1)) if minutes else 0
        seconds = int(seconds.group(1)) if seconds else 0

        video_seconds = timedelta(
            hours=hours,
            minutes=minutes,
            seconds=seconds
        ).total_seconds()

        # Just for checking the video seconds work correctly  or not
        # print(video_seconds)
        # print()

        # Adding the total seconds of entire playlist videos
        videoSeconds += video_seconds
         
    nextPageToken = pl_response.get("nextPageToken")
    if not nextPageToken:
        break
    youtube.close()

videoSeconds = int(videoSeconds)
print(f"Total Playlist Time in Seconds: {videoSeconds}")
minutes,seconds = divmod(videoSeconds,60)
hours,minutes = divmod(minutes,60)
print(f"Total Dueration of playlist: {hours}:{minutes}:{seconds}")