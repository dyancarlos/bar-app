class Product
  include Mongoid::Document

  RULES = {
    "Bebidas" =>  ["Limão", "Gelo", "Outro"],
    "Petiscos" => ["Maionese Caseira", "Azeite"]
  }

  field :name, type: String
  field :price, type: Float

  belongs_to :category
end
