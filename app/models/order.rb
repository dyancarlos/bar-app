class Order
  include Mongoid::Document

  belongs_to :table

  field :payed, type: Boolean, default: ->{ false }
  field :created_at, type: DateTime, default: ->{ Time.now }
  field :items, type: Array, default: -> { [] }

  PIZZA_PRICES  = { "P" => 20.0, "M" => 31.0, "G" => 36.0 }
  BORDER_PRICES = { "P" => 3, "M" => 4, "G" => 5 }
  SPECIAL_PRICE = 6

  def self.calculate_price(size, border, special)
    pizza  = PIZZA_PRICES[size]
    pizza += BORDER_PRICES[size] if border
    pizza += SPECIAL_PRICE       if special
    pizza
  end
end
