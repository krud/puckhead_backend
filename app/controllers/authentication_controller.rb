class AuthenticationController < ApplicationController
    def login
        username = params[:user][:username]
        password = params[:user][:password]

        @user = User.find_by(username: username)

        if !@user
            render json: {error: "Invalid Username or Password"}, status: :unauthorized
        else 
            if !@user.authenticate(password)
                render json: {error: "Invalid Username or Password"}, status: :unauthorized
            else 
                secret_key = Rails.application.secrets.secret_key_base
                token = JWT.encode({ user_id: @user.id}, secret_key)
                render json: { token: token, user: @user }
            end
        end 
    end 
end


# , include: :puck_head_games