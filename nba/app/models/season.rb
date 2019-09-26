class Season < ApplicationRecord
  has_many :teams
  has_many :players

  validates :year, presence: true, uniqueness: true
end
