class Api::V1::GuestController < ApplicationController

    before_action :authorize_request

    def edit
        modified_guest = Guest.find(params[:id])
        # if modified_guest.update(guest_name: params[:new_guest_name]) 
        #     render json: {msg: "Success", guest: modified_guest}, status: :ok
        # else
        #     render json: {msg: "Error updating guest", error: true}, status: 422
        # end
        render json: {msg: 'in progress'}, status: :ok
    end

    def destroy
        @deleted_guest = Guest.find(params[:id])
        @wedding = @deleted_guest.wedding
        if @deleted_guest.destroy
            render json: {msg: "Success", list: @wedding.guests, delGuest: @deleted_guest}, status: :ok
        else
            render json: {msg: "Error deleting Guest", error: true}, status: 422
        end
    end
end