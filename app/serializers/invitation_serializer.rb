class InvitationSerializer < ActiveModel::Serializer
    attributes :id, :style_background_color, :style_color, :style_align
    has_many :styled_lines
end