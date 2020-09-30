class Wedding < ApplicationRecord
    has_many :wedding_venues
    has_many :venues, through: :wedding_venues
    
    has_many :user_weddings
    has_many :users, through: :user_weddings

    has_many :albums
    has_many :invitations
    has_many :guests

    
    belongs_to :wedding_theme

end
