class Player < ApplicationRecord
  belongs_to :season
  belongs_to :team
  has_many :stats, as: :model, dependent: :destroy

  validates :name, presence: true
  validates :abbr, presence: true
  validates :idstr, presence: true, uniqueness: { scope: [:season_id, :team_id] }
end
