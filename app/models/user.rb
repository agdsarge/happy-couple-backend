class User < ApplicationRecord
    #belongs_to :address

    has_many :user_photos
    has_many :photos, through: :user_photos

    has_many :user_weddings

    has_many :weddings, through: :user_weddings

    has_secure_password

end
