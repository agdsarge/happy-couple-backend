class Api::V1::AuthController < ApplicationController
    #get '/login'
    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {first_name: @user.first_name, token: token}
        else
            render json: { error: true, message: 'Invalid email or password' }
        end
    end

    def register
        @user = User.new(first_name: params[:first_name], last_name: params[:last_name], gender: params[:gender], email: params[:email], password: params[:password])
        # byebug
    
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {token: token, first_name: @user.first_name}
        else
            render json: {error: true, message: 'Error registering user'}
        end
    end

end
