import sys
import bs4
from bs4 import BeautifulSoup
import requests
import re
import os
import csv

year = sys.argv[1]
url = f'https://www.basketball-reference.com/leagues/NBA_{year}_standings.html'
r  = requests.get(url)
data = r.text
data = re.sub("<!--|-->", "", data, flags=re.DOTALL)
soup = BeautifulSoup(data, features='html.parser')

team_table = soup.find(id='team_vs_team')
team_rows = team_table.find_all('td', class_='left')
team_data = [row.getText() for row in team_rows]
abbrs = [re.search('/(.{3})/', row.findChild()['href']).group(1) for row in team_rows]
teams = [data.rsplit(' ', 1) if 'Portland' not in data else data.split(' ', 1) for data in team_data]
cities = [team[0] for team in teams]
names = [team[1] for team in teams]

directory = 'lib/database/teams'
if not os.path.exists(directory):
    os.makedirs(directory)
with open(f'{directory}/{year}.csv', 'w') as f:
    writer = csv.writer(f, delimiter=',', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(['name', 'city', 'abbr'])
    for i in range(len(names)):
        writer.writerow([names[i], cities[i], abbrs[i]])
