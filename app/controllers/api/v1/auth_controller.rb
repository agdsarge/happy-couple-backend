class Api::V1::AuthController < ApplicationController
    
    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})

            wedding_list = @user.weddings.map do |wedding| 
                is_administrator = UserWedding.where('wedding_id = ? AND user_id = ?', wedding.id, @user.id).first
                {wedding: wedding, is_admin: is_administrator[:is_admin] }
            end
            render json: {first_name: @user.first_name, token: token, weddingList: wedding_list}, status: :ok
        
        else
            render json: { error: true, message: 'Invalid email or password' }, status: 401
        end
    end

    def register
        @user = User.new(first_name: params[:first_name], last_name: params[:last_name], gender: params[:gender], email: params[:email], password: params[:password])
        # byebug
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {token: token, first_name: @user.first_name, weddingList: []}, status: :ok
        else
            render json: {error: true, message: 'Error registering user'}, status: 422
        end
    end

end
