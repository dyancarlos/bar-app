class Product
  include Mongoid::Document

  field :name, type: String
  field :price, type: Float

  belongs_to :category
end
