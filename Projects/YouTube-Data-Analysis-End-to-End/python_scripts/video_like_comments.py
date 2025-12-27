import os
import pandas as pd
from dotenv import load_dotenv
from googleapiclient.discovery import build

load_dotenv()

df = pd.read_csv("youtube_videos_clean.csv")
video_id = df["video_id"].tolist()

api_key = os.getenv("api_key")
youtube = build("youtube", "v3", developerKey=api_key)

chunk_size = 50
rows = []

for start in range(0, len(video_id), chunk_size):
    chunk = video_id[start:start + chunk_size]

    vid_request = youtube.videos().list(
        part="statistics",
        id=",".join(chunk)
    )
    vid_response = vid_request.execute()

    for item in vid_response["items"]:
        stats = item.get("statistics", {})

        rows.append({
            "video_id": item["id"],
            "video_views": stats.get("viewCount"),
            "video_likes": stats.get("likeCount"),
            "video_comments": stats.get("commentCount")
        })

result_df = pd.DataFrame(rows)
result_df.to_csv("all_video_status.csv", index=False)

youtube.close()
