class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :product_id
  has_many :users
end
