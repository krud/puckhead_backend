class CreatePuckheadGames < ActiveRecord::Migration[6.0]
  def change
    create_table :puckhead_games do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
