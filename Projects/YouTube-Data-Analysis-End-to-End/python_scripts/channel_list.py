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
        part="snippet",
        forHandle=handle
    )
    ch_response = ch_request.execute()

    item = ch_response["items"][0]
    snippet = item["snippet"]

    channel_id = item["id"]
    channel_name = snippet.get("title")
    channel_url = f"https://www.youtube.com/channel/{channel_id}"

    rows.append({
        "channel_id": channel_id,
        "channel_name": channel_name,
        "channel_url": channel_url
    })

df = pd.DataFrame(rows)
df.to_csv("channel_list.csv", index=False, encoding="utf-8")

youtube.close()
