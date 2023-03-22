class Post < ApplicationRecord
    validates :title, :description, :category, :artist, presence: true
    has_one_attached :image


    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end
end
