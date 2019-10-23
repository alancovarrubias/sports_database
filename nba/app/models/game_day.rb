class GameDay < ApplicationRecord
  belongs_to :season
  has_many :games

  validates :date, presence: true

  def date_str
    return "%04d%02d%02d%01d" % [date.year, date.month, date.day, 0]
  end
end
