class Team < ApplicationRecord
  belongs_to :season
  validates :season, presence: true
  validates :name, presence: true, uniqueness: { scope: :season_id }
  validates :abbr, presence: true, uniqueness: { scope: :season_id }
  validates :city, presence: true
end
