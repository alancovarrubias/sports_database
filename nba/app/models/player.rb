class Player < ApplicationRecord
  belongs_to :season
  belongs_to :team
  has_many :player_stats

  validates :name, presence: true
  validates :abbr, presence: true, uniqueness: { scope: [:season_id, :team_id] }
end
