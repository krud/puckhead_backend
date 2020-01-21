class PuckheadGamesController < ApplicationController
    before_action :authenticate, only: [:create] 
    
    def index 
        games = PuckheadGame.all
        render json: games, include: :players
    end 

    def show 
        game = PuckheadGame.find(params_id)
        render json: game, include: :players
    end 

    def create
        game = PuckheadGame.new(puckheadGame_params)
        if game.valid?
            game.save
        end 

        render json: game, include: :players

    end 

    private 

    def puckheadGame_params
        params.require().permit(
            :user_id,
            :points
        )
    end 
end
