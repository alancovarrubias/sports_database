class Team < ApplicationRecord
  belongs_to :season
  has_many :players, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :season_id }
  validates :abbr, presence: true, uniqueness: { scope: :season_id }
  validates :city, presence: true
end
