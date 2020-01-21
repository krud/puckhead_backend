class CreatePuckheadGamePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :puckhead_game_players do |t|
      t.references :puckhead_game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
