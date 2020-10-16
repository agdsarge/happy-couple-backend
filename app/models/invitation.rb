class Invitation < ApplicationRecord
    belongs_to :wedding
    has_many :styled_lines
end
