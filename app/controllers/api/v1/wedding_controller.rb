class Api::V1::WeddingController < ApplicationController
    before_action :authorize_request, except: [:show]

    def create_new_wedding_from_wizard
        # the before_action of :authorize request gives us a @curent_user, which is a User model
        # this is nice.
        general_details = general_params(:weddingDate, :partnerOne, :partnerTwo, :theme, :slug, :registryLink)
        reception_details = reception_params(:venueName, :venueStreet, :venueCity, :venueState, :venueCountry, :venueZipCode)
        ceremony_details = ceremony_params(:venueName, :venueStreet, :venueCity, :venueState, :venueCountry, :venueZipCode)
        
        byebug
        @wedding_theme = WeddingTheme.find_by(theme_name: general_details[:theme])
        @wedding = Wedding.new(registry_link: general_details[:registryLink], wedding_date: general_details[:weddingDate], slug: general_details[:slug])
        @wedding.wedding_theme = @wedding_theme
        @wedding.save

        @user_wedding = UserWedding.new(wedding_id: @wedding.id, user_id: @current_user.id, is_admin: true, attending_status: 1, accommodation_id: nil)
        @user_wedding.save

        @reception_venue = Venue.find_or_create_by(venue_type: 1, venue_name: reception_details[:venueName], street_address: reception_details[:venueStreet], city: reception_details[:venueCity], country: reception_details[:venueCountry], zip: reception_details[:venueZipCode])
        @ceremony_venue = Venue.find_or_create_by(venue_type: 2, venue_name: ceremony_details[:venueName], street_address: ceremony_details[:venueStreet], city: ceremony_details[:venueCity], country: ceremony_details[:venueCountry], zip: ceremony_details[:venueZipCode])

        @wedding_venue_reception = WeddingVenue.new(wedding: @wedding, venue:@reception_venue)
        @wedding_venue_reception.save
        @wedding_venue_ceremony = WeddingVenue.new(wedding: @wedding, venue:@ceremony_venue)
        @wedding_venue_ceremony.save
        
        render json: {mesg: "test message in Rails", r1: general_details}
    end

    def todos
        wedding_todos = ToDo.where("wedding_id = ?",params[:id])
        render json: {message: "Success", list: wedding_todos}, status: :ok
    end

    def add_guests
        guests_to_add = params[:guestList]
        @wedding = Wedding.find(params[:weddingID])
        
        guests_to_add.each do |gst|
            specific_guest = gst[0].to_sym #
            guest_info = guest_params(specific_guest, :firstName, :lastName, :email, :role)
            #create guest
            # send over wedding info :)
            new_guest = Guest.find_or_create_by(wedding: @wedding, first_name: guest_info[:firstName], last_name: guest_info[:lastName], email: guest_info[:email], role: guest_info[:role])
            new_guest.save
            if new_guest.email != ''
                @user = User.find_by(first_name: guest_info[:firstName], last_name: guest_info[:lastName], email: guest_info[:email])
                unless @user
                    @user = User.new(first_name: guest_info[:firstName], last_name: guest_info[:lastName], email: guest_info[:email], password: @wedding.slug)
                    @user.save
                end
                @uw = UserWedding.find_or_create_by(user: @user, wedding: @wedding)
            end    
        end
        render json: {message: "GUESTS ADDED!", list: @wedding.guests}, status: :ok
    end

    def get_guests
        @guests = Guest.where("wedding_id = ?",params[:id])
        render json: {message: "Success", list: @guests}, status: :ok
    end

    def show
        # byebug
        wedding = Wedding.find_by(slug: params[:slug])
        theme = wedding.wedding_theme
        render json: {msg: 'success', wedding: wedding, theme: theme}
    end

    private
    def general_params(*args) 
        params.require(:general).permit(*args)
    end

    def reception_params(*args)
        params.require(:reception).permit(*args)
    end

    def ceremony_params(*args)
        params.require(:ceremony).permit(*args)
    end

    def guest_params(specific_guest, *args)

        params.require(:guestList).require(specific_guest).permit(*args)
    end

end
