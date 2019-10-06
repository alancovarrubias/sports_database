class GameDay < ApplicationRecord
  belongs_to :season
  has_many :games

  validates :date, presence: true
end
