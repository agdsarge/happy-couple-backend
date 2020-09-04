class Api::V1::AuthController < ApplicationController
    #get '/login'
    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else
            render json: { error: true, message: 'Invalid email or password' }
        end
    end

end
