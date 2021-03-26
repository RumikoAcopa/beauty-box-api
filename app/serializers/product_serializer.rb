class ProductSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :quantity, :details
  # belongs_to :category
end
