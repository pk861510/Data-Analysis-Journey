import os
import re
import pandas as pd
from datetime import timedelta
from dotenv import load_dotenv
from googleapiclient.discovery import build

load_dotenv()

df = pd.read_csv("youtube_videos_clean.csv")
video_id = df["video_id"].tolist()

api_key = os.getenv("api_key")
youtube = build("youtube", "v3", developerKey=api_key)

hours_pattern = re.compile(r"(\d+)H")
minutes_pattern = re.compile(r"(\d+)M")
seconds_pattern = re.compile(r"(\d+)S")

videoSeconds = 0
chunk_size = 5
rows = []

for start in range(0, len(video_id), chunk_size):
    chunk = video_id[start:start + chunk_size]

    vid_request = youtube.videos().list(
        part="contentDetails",
        id=",".join(chunk)
    )
    vid_response = vid_request.execute()

    for item in vid_response["items"]:
        duration = item["contentDetails"]["duration"]

        h = hours_pattern.search(duration)
        m = minutes_pattern.search(duration)
        s = seconds_pattern.search(duration)

        h = int(h.group(1)) if h else 0
        m = int(m.group(1)) if m else 0
        s = int(s.group(1)) if s else 0

        total_seconds = int(timedelta(hours=h, minutes=m, seconds=s).total_seconds())
        videoSeconds += total_seconds

        duration_hms = f"{h:02}:{m:02}:{s:02}"

        rows.append({
            "video_id": item["id"],
            "video_duration": duration_hms,
            "video_quality": item["contentDetails"].get("definition"),
            "video_kind": item.get("kind")
        })

videoSeconds = int(videoSeconds)
print(f"Total Playlist Time in Seconds: {videoSeconds}")
minutes, seconds = divmod(videoSeconds, 60)
hours, minutes = divmod(minutes, 60)
print(f"Total Dueration of playlist: {hours}:{minutes}:{seconds}")

result_df = pd.DataFrame(rows)
result_df.to_csv("all_youtube_videos_metadata.csv", index=False)

youtube.close()
