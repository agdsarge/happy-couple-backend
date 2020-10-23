class Api::V1::PhotosController < ApplicationController

    # before_action :authorize_request, except: :create

    def index
        render json: {mesg: 'hello', photos: Photo.all}
    end

    def create
        @wedding = Wedding.find(params[:wedding_id])
        @album = @wedding.albums.first
        
        i = 0
        while (i < params[:images].length)
            puts params[:images][i]
            
            new_photo = Photo.create(album_id: @album.id, caption: params[:captions][i], image: params[:images][i])
            i += 1
        end
        render json: {msg: "success", error: false}, status: :ok
        
        
        # new_photo = Photo.create(album_id: 1, caption: "Something", image: params[:image])
        # if new_photo
        #     render json: {msg: "success", error: false}, status: :ok
        # else
        #     render json: {msg: "error", error: true}, status: 422
        # end
    end

    def loadpic
        new_photo = Photo.last
        image_url = Rails.application.routes.url_helpers.rails_blob_path(new_photo.image, only_path: true)
        total_url = 'http://localhost:3005'+image_url
        return_image = Photo.last.image
        render json: {image: new_photo, return_img: return_image, image_url: total_url}

    end


end
