class Player < ApplicationRecord
  belongs_to :season
  belongs_to :team

  validates :name, presence: true
  validates :abbr, presence: true
  validates :idstr, presence: true, uniqueness: { scope: :season_id }
end
