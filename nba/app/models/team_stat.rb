class TeamStat < ApplicationRecord
  belongs_to :season
  belongs_to :game
  belongs_to :team
  belongs_to :opp, class_name: "TeamStat"
end
