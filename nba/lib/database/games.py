import sys
import os
import csv
import requests
import bs4
from bs4 import BeautifulSoup
import calendar
from calendar import month_name

# Yield successive n-sized 
# chunks from l. 
def divide_chunks(l, n): 
    # looping till length l 
    for i in range(0, len(l), n):  
        yield l[i:i + n] 

year = sys.argv[1]
month_indices = [10, 11, 12, 1, 2, 3, 4, 5, 6]
dates = []
away_team_names = []
home_team_names = []
for index in month_indices:
    month = month_name[index].lower()
    url = f'https://www.basketball-reference.com/leagues/NBA_{year}_games-{month}.html'
    r  = requests.get(url)
    data = r.text
    soup = BeautifulSoup(data, features='html.parser')

    game_table = soup.find_all('td', class_='left')
    games = [row.getText() for row in game_table]
    game_chunks = list(divide_chunks(games, 3))
    away_teams = [chunk[0] for chunk in game_chunks]
    home_teams = [chunk[1] for chunk in game_chunks]
    away_team_names += [team.rsplit(' ', 1)[1] if 'Portland' not in team else team.split(' ', 1)[1] for team in away_teams]
    home_team_names += [team.rsplit(' ', 1)[1] if 'Portland' not in team else team.split(' ', 1)[1] for team in home_teams]

    date_rows = soup.find_all('th', class_='left')
    dates += [row.getText() for row in date_rows]

directory = 'lib/database/games'
if not os.path.exists(directory):
    os.makedirs(directory)
with open(f'{directory}/{year}.csv', 'w') as f:
    writer = csv.writer(f, delimiter=',', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(['date', 'away_team', 'home_team'])
    for i in range(len(dates)):
        writer.writerow([dates[i], away_team_names[i], home_team_names[i]])
