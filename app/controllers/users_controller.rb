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

        secret_key = Rails.application.secrets.secret_key_base
        token = JWT.encode({ user_id: @user.id}, secret_key)
        render json: { token: token, user: @user }

    end 

    private 

    def find_user
        @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit([:name, :username, :password])
    end 
end
