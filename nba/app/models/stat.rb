class Stat < ApplicationRecord
  belongs_to :season
  belongs_to :game
  belongs_to :model, polymorphic: true
  belongs_to :team, foreign_key: :model_id, optional: true
  belongs_to :player, foreign_key: :model_id, optional: true
end
