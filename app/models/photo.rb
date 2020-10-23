class Photo < ApplicationRecord

    
    belongs_to :album
    has_many :user_photos
    has_many :users, through: :user_photos
    
    has_one_attached :image


    def get_image_url
        image_url = Rails.application.routes.url_helpers.rails_blob_path(self.image, only_path: true)
        total_url = 'http://localhost:3005'+image_url
    end

end
