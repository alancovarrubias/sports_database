class CreateTeamStats < ActiveRecord::Migration[6.0]
  def change
    create_table :team_stats do |t|
      t.references :season
      t.references :game
      t.references :team
      t.references :opp, references: :team_stat
      t.integer :period
    end
  end
end
