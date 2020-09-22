class Api::V1::UserController < ApplicationController
    before_action :authorize_request
    def get_wedding_date
        @uw = UserWedding.find_by(user: @current_user, is_admin: true)
        if @uw
            date = @uw.wedding.wedding_date
            render json: {weddingDate: date} 
        else
            render json: {mesg: 'no date set yet!'} 
        end

    end
end