class Order
  include Mongoid::Document

  PIZZA_PRICES  = { "P" => 20.0, "M" => 31.0, "G" => 36.0 }
  BORDER_PRICES = { "P" => 3.0, "M" => 4.0, "G" => 5.0 }
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

  def self.total(obj)
    obj.map { |v| v["price"] * v["quantity"] }.inject(:+)
  end

  def self.total_product(obj)
    obj["quantity"] * obj["price"]
  end
end
