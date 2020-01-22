class PuckheadGamesController < ApplicationController
    
    def index 
        games = PuckheadGame.all
        render json: games
    end 

    def show 
        game = PuckheadGame.find(params_id)
        render json: game
    end 

    def create
        game = PuckheadGame.new(puckheadGame_params)
        if game.valid?
            game.save
        end 

        render json: game

    end 

    private 

    def puckheadGame_params
        params.require(:puckhead_game).permit(
            :user_id,
            :points
        )
    end 
end
