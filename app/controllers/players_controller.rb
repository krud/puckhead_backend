class PlayersController < ApplicationController
    def index
        players = Player.all 
        render json: players
    end 

    def show
        player = Player.find(params_id)
        render json: player
    end 
end
