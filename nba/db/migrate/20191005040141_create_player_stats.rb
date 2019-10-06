class CreatePlayerStats < ActiveRecord::Migration[6.0]
  def change
    create_table :player_stats do |t|
      t.references :season
      t.references :game
      t.references :player
      t.references :team_stat
      t.references :opp_team_stat, references: :team_stat
      t.integer :period
    end
  end
end
