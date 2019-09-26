class Season < ApplicationRecord
  validates :year, presence: true, uniqueness: true
  has_many :teams
end
