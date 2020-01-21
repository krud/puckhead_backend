class User < ApplicationRecord
    has_secure_password
    has_many :puck_head_game
end
