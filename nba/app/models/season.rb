class Season < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :games, dependent: :destroy

  validates :year, presence: true, uniqueness: true
end
