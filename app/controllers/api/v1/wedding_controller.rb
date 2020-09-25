class Api::V1::WeddingController < ApplicationController
    before_action :authorize_request

    def create_new_wedding_from_wizard
        # the before_action of :authorize request gives us a @curent_user, which is a User model
        # this is nice.
        general_details = general_params(:weddingDate, :partnerOne, :partnerTwo, :theme, :slug, :registryLink)
        reception_details = reception_params(:venueName, :venueStreet, :venueCity, :venueState, :venueCountry, :venueZipCode)
        ceremony_details = ceremony_params(:venueName, :venueStreet, :venueCity, :venueState, :venueCountry, :venueZipCode)
        
        # byebug
        @wedding_theme = WeddingTheme.find_by(theme_name: general_details[:theme])
        @wedding = Wedding.new(registry_link: general_details[:registryLink], wedding_date: general_details[:weddingDate], wedding_slug: general_details[:slug])
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
end

# {, 
# "general"=>{
#     "weddingDate"=>nil, 
#     "partnerOne"=>nil, 
#     "partnerTwo"=>nil, 
#     "theme"=>"1", 
#     "fontFamily"=>"1", 
#     "slug"=>nil, 
#     "registryLink"=>nil
# }, 
# "reception"=>{
#     "venueName"=>nil, 
#     "venueStreet"=>nil, 
#     "venueCity"=>nil, 
#     "venueState"=>nil, 
#     "venueCountry"=>nil, 
#     "venueZipCode"=>"HELLO"
# }, 
# "ceremony"=>{
#     "venueName"=>nil, 
#     "venueStreet"=>nil, 
#     "venueCity"=>nil, 
#     "venueState"=>nil, 
#     "venueCountry"=>nil, 
#     "venueZipCode"=>nil}, 
# "wedding"=>{}
# }