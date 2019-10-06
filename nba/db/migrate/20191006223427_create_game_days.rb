class CreateGameDays < ActiveRecord::Migration[6.0]
  def change
    create_table :game_days do |t|
      t.references :season
      t.date :date
    end
  end
end
