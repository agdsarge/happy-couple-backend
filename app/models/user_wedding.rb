class UserWedding < ApplicationRecord

    belongs_to :user
    belongs_to :wedding
    belongs_to :venue
    
end
