class Api::V1::UserWeddingController < ApplicationController

    def update
        # byebug
        user_wedding = UserWedding.find(params[:id])
        if params[:attending_status] == "yes"
            updated_status = 2
        else
            updated_status = 3 
        end
        if user_wedding.update(attending_status: updated_status)
            render json: {msg: "Success", error: false, uw: user_wedding}, status: :ok
        else
            render json: {msg: "Could not update record", error: true}, status: :unprocessable_entity
        end
    end


end
