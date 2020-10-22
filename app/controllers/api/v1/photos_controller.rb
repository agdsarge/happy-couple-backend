class Api::V1::PhotosController < ApplicationController
    def index
        render Photo.all
    end

    def tester
        # render json: {mesg: 'This is a string', image: Photo.last.image}
        render Photo.last.image
    end


    def create
        # @wedding = Wedding.find(params[:wedID])
        # @album = @wedding.albums.first
        new_photo = Photo.create(album: Album.first, caption: "Something", image: params[:image])
        
        if new_photo
            render json: {msg: "success", error: false}, status: :ok
        else
            render json: {msg: "error", error: true}, status: 422
        end
    end

    private
    def picture_params
        params.permit(:caption, :image)
    end

end
