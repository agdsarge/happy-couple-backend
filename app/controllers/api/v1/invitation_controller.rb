class Api::V1::InvitationController < ApplicationController

    before_action :authorize_request

    def create
        @invitation = Invitation.new(wedding_id: params[:id])
        style_details = style_params(:backgroundColor, :color, :textAlign)
        style = {style_background_color: style_details[:backgroundColor], style_color: style_details[:color], style_align: style_details[:textAlign]}
        
        @invitation.update(style)

        lines = params[:lines]
        lines.keys.each do |num|
            line_sym = num.to_sym
            line_text = line_text_param(line_sym, :text)
            line_style = line_style_params(line_sym, :fontFamily, :fontSize, :color, :textAlign)
            
            line_data = {}

            line_data['line' + num + '_text'] = line_text[:text]
            line_data['line' + num + '_font'] = line_style[:fontFamily]
            line_data['line' + num + '_size'] = line_style[:fontSize]
            line_data['line' + num + '_color'] = line_style[:color]
            line_data['line' + num + '_align'] = line_style[:textAlign]
            
            @invitation.update(line_data)

        end
        @invitation.save
        render json: {mesg: 'YOU HAVE SAVED AN INVITATION!'}
    end

    private

    def style_params(*args)
        params.require(:invitationStyle).permit(*args)
    end

    def line_text_param(line, *args)
        params.require(:lines).require(line).permit(*args)
    end

    def line_style_params(line, *args)
        params.require(:lines).require(line).require(:lineStyle).permit(*args)
    end

end
