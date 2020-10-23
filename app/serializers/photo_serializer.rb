class PhotoSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes :id, :album_id, :caption, :image

    def image
        if object.image.attached?
            {url: rails_blob_url(object.image)}
        end
    end

end
