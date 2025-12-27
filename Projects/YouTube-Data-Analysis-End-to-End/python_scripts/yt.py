import os
from dotenv import load_dotenv
from googleapiclient.discovery import build
load_dotenv()

api_key = os.getenv('api_key')
youtube = build('youtube', 'v3',developerKey = api_key)
request = youtube.channels().list(
forUsername = 'schafer5'
, part =  'contentDetails,statistics')


response = request.execute()
print(response)
youtube.close()

