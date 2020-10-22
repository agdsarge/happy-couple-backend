class Photo < ApplicationRecord

    
    belongs_to :album
    has_many :user_photos
    has_many :users, through: :user_photos
    
    has_one_attached :image

end
