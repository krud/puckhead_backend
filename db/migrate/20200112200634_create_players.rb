class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :firstName
      t.string :lastName
      t.integer :primaryNumber
      t.boolean :active
      t.string :currentTeam
      t.string :primaryPosition
      t.string :img
      
      t.timestamps
    end
  end
end
