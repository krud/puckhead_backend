class Player < ApplicationRecord
    has_many :puckhead_game_players
    has_many :puckhead_games, through: :puckhead_game_players
end
