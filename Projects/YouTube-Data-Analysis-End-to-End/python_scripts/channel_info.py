import os
from dotenv import load_dotenv
from googleapiclient.discovery import build
load_dotenv()

api_key = os.getenv('api_key')
youtube = build('youtube', 'v3',developerKey = api_key)

channel_id = ['@LukeBarousse','@ProfessorOfHow']

for i in range(0, len(channel_id)):
    # print(channel_id[i])
    request = youtube.channels().list(
        forHandle = channel_id[i]
        ,part =  'contentDetails,statistics')
    
    response = request.execute()

    # print(response["items"][0]["id"])
    # print(response["items"][0]["statistics"])
    print(response)
    uploads_playlist_id = response['items'][0]["id"]
    print(uploads_playlist_id)
    print()

youtube.close()

#get chennal id used further playlist_items.py
#make channel response and get playlist id