# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
season = Season.create(year: 2019)
team1 = Team.create(season: season, name: "team1", abbr: "abbr1", city: "city1")
team2 = Team.create(season: season, name: "team2", abbr: "abbr2", city: "city2")
game = Game.create(season: season, away_team: team1, home_team: team2, date: Date.today)

