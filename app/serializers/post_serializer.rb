class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description, :price, :image, :created_at, :updated_at, :image_url
end
