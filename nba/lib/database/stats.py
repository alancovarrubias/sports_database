import sys
import bs4
from bs4 import BeautifulSoup
import requests
import re
import os
import csv

class Stat:
    def __init__(self, stat_row):
        self.stat_row = stat_row
    
    def get_abbr(self):
        return self.stat_row.findChild('th')['data-append-csv']

    def get_sp(self):
        minutes, seconds = self.stat_row.findChild('td', { 'data-stat': 'mp' }).getText().split(':')
        return int(minutes) * 60 + int(seconds)
    
    def get_stat(self, stat):
        return int(self.stat_row.findChild('td', { 'data-stat': stat }).getText()) 

    def get(self, stat):
        did_play = self.stat_row.findChild('td', { 'data-stat': 'mp' }) != None
        if stat == 'abbr':
            return self.get_abbr()
        elif stat == 'sp':
            return self.get_sp() if did_play else 0
        else:
            return self.get_stat(stat) if did_play else 0

date = sys.argv[1]
away_team = sys.argv[2]
home_team = sys.argv[3]
url = f'https://www.basketball-reference.com/boxscores/{date}{home_team}.html'
r  = requests.get(url)
data = r.text
soup = BeautifulSoup(data, features='html.parser')

def write_stats(team):
    stat_table = soup.find(id=f'box-{team}-game-basic')
    stat_rows = stat_table.find('tbody').findChildren('tr', {'class': None})
    stats = [Stat(stat_row) for stat_row in stat_rows]
    attributes = ['abbr', 'sp', 'fg', 'fga', 'fg3', 'fg3a', 'ft', 'fta', 'orb', 'drb', 'ast', 'stl', 'tov', 'pf']
    stat_data = [[stat.get(attr) for attr in attributes] for stat in stats]

    directory = f'lib/database/stats/{date}'
    if not os.path.exists(directory):
        os.makedirs(directory)
    with open(f'{directory}/{team}.csv', 'w') as f:
        writer = csv.writer(f, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(attributes)
        for data in stat_data:
            writer.writerow(data)

write_stats(away_team)
write_stats(home_team)
