class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.references :season
      t.references :game
      t.references :model, polymorphic: true
      t.integer :period
    end
  end
end
