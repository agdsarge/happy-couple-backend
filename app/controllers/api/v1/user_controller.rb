class Api::V1::UserController < ApplicationController
    
    def get_wedding_date
        # @id = params[:id]
        # byebug
        # @user = User.find(@id)
        # my_wedding = Wedding.joins(:users).where(users: {id: @id}) 
        render json: {weddingDate: 'Thu, 31 Dec 2020 18:30:00 UTC +00:00'} 
        #render json: {weddingDate: 'Fri, 18 Sep 2020 18:30:00 UTC +00:00'} 
    end

end