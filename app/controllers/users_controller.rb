class UsersController < ApplicationController
    before_action :find_user, only: [:update, :destroy, :show]

    def index 
        @users = User.all 
        render json: @users 
    end 

    def show 
        render json: @user
    end 

    def create
        @user = User.create(user_params)
        render json: @user, status: :created
    end 

    private 

    def find_user
        @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit([:name, :username, :password])
    end 
end
