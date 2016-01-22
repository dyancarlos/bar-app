class Order
  include Mongoid::Document

  PIZZA_PRICES  = { "P" => 20, "M" => 31, "G" => 36 }
  BORDER_PRICES = { "P" => 3, "M" => 4, "G" => 5 }
  SPECIAL_PRICE = 6

  field :payed, type: Boolean, default: ->{ false }
  field :created_at, type: DateTime, default: ->{ Time.now }
  field :items, type: Array, default: -> { [] }

  belongs_to :table

  def self.calculate_price(size, border, special)
    pizza  = PIZZA_PRICES[size]
    pizza += BORDER_PRICES[size] if border
    pizza += SPECIAL_PRICE       if special
    pizza
  end
end
