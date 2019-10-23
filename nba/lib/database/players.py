import sys
import bs4
from bs4 import BeautifulSoup
import requests
import re
import os
import csv

# Yield successive n-sized 
# chunks from l. 
def divide_chunks(l, n): 
    # looping till length l 
    for i in range(0, len(l), n):  
        yield l[i:i + n] 

year = sys.argv[1]
team = sys.argv[2]
url = f'https://www.basketball-reference.com/teams/{team}/{year}.html'
r  = requests.get(url)
data = r.text
soup = BeautifulSoup(data, features='html.parser')

player_table = soup.find(id='roster')
player_rows = soup.find_all('td', class_='left')
player_chunks = list(divide_chunks(player_rows, 3))

players = [chunk[0] for chunk in player_chunks]
names = [player.getText() for player in players]
abbrs = [player['data-append-csv'] for player in players]

directory = f'lib/database/players/{year}'
if not os.path.exists(directory):
    os.makedirs(directory)
with open(f'{directory}/{team}.csv', 'w') as f:
    writer = csv.writer(f, delimiter=',', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(['name', 'abbr'])
    for i in range(len(names)):
        writer.writerow([names[i], abbrs[i]])
