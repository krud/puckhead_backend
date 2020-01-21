class PuckheadGame < ApplicationRecord
    belongs_to :user
    
    has_many :puckhead_game_players
    has_many :players, through: :puckhead_game_players
end
