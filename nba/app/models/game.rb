class Game < ApplicationRecord
  belongs_to :season
  belongs_to :game_day
  belongs_to :away_team, class_name: "Team"
  belongs_to :home_team, class_name: "Team"
  has_many :team_stats, dependent: :destroy
  has_many :player_stats, dependent: :destroy

  def date
    game_day.date
  end

  def teams
    [away_team, home_team]
  end

  def method_missing(method, *args, &block)
    game_day.send(method, *args, &block)
  end
end
