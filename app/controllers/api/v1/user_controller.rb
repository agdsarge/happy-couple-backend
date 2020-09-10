class Api::V1::UserController < ApplicationController
    
    def get_wedding_date
        @id = params[:id]
        byebug
        @user = User.find(@id)
        my_wedding = Wedding.joins(:users).where(users: {id: @id}) 

    end

end