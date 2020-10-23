class Album < ApplicationRecord
    has_many :photos
    belongs_to :wedding

    # not tested
    validates :is_bio, uniqueness: {scope: :wedding_id,  message: "There is already a Biographical album for this wedding." }

end
