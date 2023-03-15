class Post < ApplicationRecord
    validates :title, :description, :price, presence: true
    has_one_attached :image

    def to_s
        title
    end
    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end
end
