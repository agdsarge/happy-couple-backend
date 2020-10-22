class Api::V1::PhotosController < ApplicationController

    before_action :authorize_request

    def create
        
        
        new_photo = Photo.create(album_id: 1, caption: "Something", image: params[:image])
        
        if new_photo
            render json: {msg: "success", error: false}, status: :ok
        else
            render json: {msg: "error", error: true}, status: 422
        end
    end

    def loadpic
        new_photo = Photo.last
        image_url = Rails.application.routes.url_helpers.rails_blob_path(new_photo.image, only_path: true)
        total_url = 'http://localhost:3005'+image_url
        return_image = Photo.last.image
        render json: {image: new_photo, return_img: return_image, image_url: total_url}

    end


end
