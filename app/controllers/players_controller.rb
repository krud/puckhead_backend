class PlayersController < ApplicationController
    def index
        players = Player.all 
        render json: players
    end 

    def show
        player = Player.find(params[:id])
        render json: player
    end 

    def update 
        player = Player.find(params[:id])
        player.update(img: params[:img])
        render json: player
    end 
end
