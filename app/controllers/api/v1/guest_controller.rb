class Api::V1::GuestController < ApplicationController

    before_action :authorize_request
    def index
        render json: Guest.all
    end
    
    def edit
        @modified_guest = Guest.find(params[:id])
        
        if @modified_guest.update(guest_params())
            all_guests = @modified_guest.wedding.guests
            render json: {msg: "Success", guest: @modified_guest, list: all_guests}, status: :ok
        else
            render json: {msg: "Error updating guest", error: true}, status: 422
        end
    end

    def destroy
        @deleted_guest = Guest.find(params[:id])
        @wedding = @deleted_guest.wedding
        if @deleted_guest.destroy
            render json: {msg: "Success", list: @wedding.guests, delGuest: @deleted_guest}, status: :ok
        else
            render json: {msg: "Error deleting guest", error: true}, status: 422
        end
    end

    private 
    def guest_params
        params.require(:guest).permit(:id, :first_name, :last_name, :email, :role, :wedding_id)
    end

end