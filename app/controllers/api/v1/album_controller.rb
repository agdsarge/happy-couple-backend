class Api::V1::AlbumController < ApplicationController

    before_action :authorize_request

    def index
        #find wedding
        wedding = Wedding.find(params[:id])
        wedding_albums = wedding.albums.map do |wa|  
            if wa.photos.length > 0
                {id: wa.id, wedding_id: wa.wedding_id, title: wa.title, is_bio: wa.is_bio, created_at: wa.created_at, image_count: wa.photos.length, image_url: wa.photos.last.get_image_url}
            else 
                {id: wa.id, wedding_id: wa.wedding_id, title: wa.title, is_bio: wa.is_bio, created_at: wa.created_at, image_count: 0}
            end
        end
        render json: {message: 'Success', error: false, albums: wedding_albums}, status: :ok
    end

    def create
        # byebug
        #find wedding
        wedding = Wedding.find(params[:w_id])
        # check if wedding is valid
        if wedding
            #create album array
            wedding_albums = wedding.albums
            # check if there is a bio
            curr_bio = wedding_albums.find do |wa| wa.is_bio end
            if curr_bio
                # if there is a bio
                if params[:new_album][:isBio]
                    #check if user input bio is true
                    new_album = Album.create(wedding_id: wedding.id, title: params[:new_album][:albumName], is_bio: true) 
                    # set previous bio to false 
                    curr_bio.update(is_bio: false)    
                else 
                    new_album = Album.create(wedding_id: wedding.id, title: params[:new_album][:albumName], is_bio: false) 
                end
            else 
                new_album = Album.create(wedding_id: wedding.id, title: params[:new_album][:albumName], is_bio: params[:new_album][:isBio]) 
            end
            
            if new_album
                render json: {msg: 'Success', error: false, new_album: new_album, old_bio: curr_bio}, status: :ok
            else
                render json: {msg: 'Error creating album', error: true}, status: :bad_request
            end
        else 
            render json: {msg: 'Invalid Wedding Id', error: true}, status: :unprocessable_entity
        end
    end

    def show


    end

    def update


    end

    def destroy

    end

end
