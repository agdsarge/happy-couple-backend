class Api::V1::InvitationController < ApplicationController

    before_action :authorize_request

    def create
        @invitation = Invitation.new(wedding_id: params[:id])

        style_details = style_params(:backgroundColor, :color, :textAlign)
        style = {style_background_color: style_details[:backgroundColor], style_color: style_details[:color], style_align: style_details[:textAlign]} 
        @invitation.update(style)

        15.times do |int|
            sl = StyledLine.find_or_create_by(invitation_id: @invitation.id, line_number: int)
            sl.save

            line_sym = int.to_s
            line_text = line_text_params(line_sym, :text)
            line_style = line_style_params(line_sym, :fontFamily, :fontSize, :color, :textAlign)

            line_data = {text: line_text[:text], fontFamily: line_style[:fontFamily], fontSize: line_style[:fontSize], color: line_style[:color], textAlign: line_style[:textAlign]}
            
            sl.update(line_data)
            sl.save
        end

        if @invitation.save
            render json: {msg: 'YOU HAVE SAVED AN INVITATION!'}
        else
            render json: {msg: 'Error creating invitation', error: true}, status: 422
        end
    end

    def edit
        @invitation = Invitation.where("wedding_id = ?", params[:id]).last
        
        style_details = style_params(:backgroundColor, :color, :textAlign)
        style = {style_background_color: style_details[:backgroundColor], style_color: style_details[:color], style_align: style_details[:textAlign]} 
        @invitation.update(style)

        15.times do |int|
            sl = StyledLine.find_by(invitation_id: @invitation.id, line_number: int)
            
            line_sym = int.to_s
            line_text = line_text_params(line_sym, :text)
            line_style = line_style_params(line_sym, :fontFamily, :fontSize, :color, :textAlign)

            line_data = {text: line_text[:text], fontFamily: line_style[:fontFamily], fontSize: line_style[:fontSize], color: line_style[:color], textAlign: line_style[:textAlign]}

            sl.update(line_data)
            sl.save
        end
     
        if @invitation.save
            render json: {msg: 'You have updated this invtation!'}, status: 200
        else
            render json: {msg: 'Error updating invitation', error: true}, status: 422
        end
    end


    private

    def style_params(*args)
        params.require(:invitationStyle).permit(*args)
    end

    def line_text_params(line, *args)
        params.require(:lines).require(line).permit(*args)
    end

    def line_style_params(line, *args)
        params.require(:lines).require(line).require(:lineStyle).permit(*args)
    end

end
