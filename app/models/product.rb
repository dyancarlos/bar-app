class Product
  include Mongoid::Document

  field :name, type: String
  field :price, type: Float
  field :category_id, type: BSON::ObjectId

  belongs_to :category
end
