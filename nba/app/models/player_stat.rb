class PlayerStat < ApplicationRecord
  belongs_to :player
  belongs_to :season
  belongs_to :game
  belongs_to :team_stat
  belongs_to :opp_team_stat, class_name: "TeamStat"
end
