class Venue < ApplicationRecord
    has_many :wedding_venues
    has_many :weddings, through: :wedding_venues
    
    has_many :user_weddings
    has_many :users, through: :user_weddings
end
