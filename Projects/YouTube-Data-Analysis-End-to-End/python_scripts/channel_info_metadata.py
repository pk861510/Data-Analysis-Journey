import os
import pandas as pd
from dotenv import load_dotenv
from googleapiclient.discovery import build

load_dotenv()

api_key = os.getenv("api_key")
youtube = build("youtube", "v3", developerKey=api_key)

channel_handles = ["@mohak_mangal", "@ANINewsIndia", "@krishnaik06"]
rows = []

for handle in channel_handles:
    ch_request = youtube.channels().list(
        part="snippet,statistics",
        forHandle=handle
    )
    ch_response = ch_request.execute()

    item = ch_response["items"][0]
    snippet = item["snippet"]
    stats = item["statistics"]

    rows.append({
        "channel_id": item["id"],
        "channel_title": snippet.get("title"),
        "channel_desc": snippet.get("description"),
        "subscriber_count": stats.get("subscriberCount"),
        "video_count": stats.get("videoCount"),
        "view_count": stats.get("viewCount"),
        "channel_published_at": snippet.get("publishedAt")
    })

df = pd.DataFrame(rows)
df.to_csv("channel_metadata.csv", index=False, encoding="utf-8")

youtube.close()
