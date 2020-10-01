class Wedding < ApplicationRecord
    after_validation :set_slug, only: [:create_new_wedding_from_wizard, :update]
    has_many :wedding_venues
    has_many :venues, through: :wedding_venues
    
    has_many :user_weddings
    has_many :users, through: :user_weddings

    has_many :albums
    has_many :invitations
    has_many :guests

    
    belongs_to :wedding_theme


    def to_param
        "#{slug}"
    end


    private 

    def set_slug
        self.slug = slug.to_s.parameterize
    end

end
