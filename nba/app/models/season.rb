class Season < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :game_days, dependent: :destroy
  has_many :players
  has_many :games
  has_many :team_stats
  has_many :player_stats

  validates :year, presence: true, uniqueness: true
end
