import os
import re
import pandas as pd
from dotenv import load_dotenv
from googleapiclient.discovery import build
load_dotenv()
api_key = os.getenv('api_key')
youtube = build('youtube', 'v3',developerKey = api_key)


channel_id = ["@mohak_mangal", "@ANINewsIndia", "@krishnaik06"]
videos = []

for i in range(0, len(channel_id)):
    ch_request = youtube.channels().list(
        part='contentDetails',
        forHandle = channel_id[i]
    )
    nextPageToken = None
    ch_response = ch_request.execute()
    # print(ch_response)
    uploads_playlist_id = (
        ch_response['items'][0]
        ['contentDetails']
        ['relatedPlaylists']
        ['uploads']
    )
    print("Uploads Playlist ID:", uploads_playlist_id)

    while True:

        pl_items_request = youtube.playlistItems().list(
            part='snippet,contentDetails',
            pageToken = nextPageToken,
            maxResults=50,
            playlistId=uploads_playlist_id
        )

        pl_items_response = pl_items_request.execute()
        # print(pl_items_response) #this might give UnicodeEncode Error because of emoji and special symbols


        for item in pl_items_response["items"]:
            videos.append({
                "cnannel_id": item["snippet"]["channelId"],
                "video_id": item["contentDetails"]["videoId"],
                "published_at": item["contentDetails"]["videoPublishedAt"],
                "title": item["snippet"]["title"],
                "description": item["snippet"]["description"]
            })
        nextPageToken = pl_items_response.get("nextPageToken")
        if not nextPageToken:
            break
            
df = pd.DataFrame(videos)
df.to_csv("allvideos.csv")

    # item = pl_items_response["items"][0]
    # print(item.keys())
    # print(item["snippet"].keys())
    # print(item["contentDetails"].keys())
print(df.info())
youtube.close()

def clean_text(text):
    if not isinstance(text, str):
        return text

    # remove emojis and non-ASCII chars
    text = re.sub(r'[^\x00-\x7F]+', '', text)

    # optional: normalize spaces
    text = re.sub(r'\s+', ' ', text).strip()

    return text
df["title"] = df["title"].apply(clean_text)
df["description"] = df["description"].apply(clean_text)
df.to_csv("youtube_videos_clean.csv", index=False, encoding="utf-8")

