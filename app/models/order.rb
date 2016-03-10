class Order
  include Mongoid::Document

  PIZZA_PRICES   = { "P" => 20.0, "M" => 31.0, "G" => 36.0 }
  BORDER_PRICES  = { "P" => 3.0, "M" => 4.0, "G" => 5.0 }
  SPECIAL_PRICE  = 6
  GREEN_SECONDS  = 300
  ORANGE_SECONDS = 600

  field :payed, type: Boolean, default: ->{ false }
  field :created_at, type: DateTime, default: ->{ Time.now }
  field :updated_at, type: DateTime, default: ->{ Time.now }
  field :items, type: Array, default: -> { [] }

  belongs_to :table

  def self.calculate_price(size, border, special)
    pizza  = PIZZA_PRICES[size]
    pizza += BORDER_PRICES[size] if border
    pizza += SPECIAL_PRICE       if special
    pizza
  end

  # Calculate the total of the entire items of the Hash
  #
  def self.total(obj)
    obj.map { |v| v["price"] * v["quantity"] }.inject(:+)
  end

  # Calculate the total of an specific item (quantity * price)
  #
  def self.total_product(obj)
    obj["quantity"] * obj["price"]
  end

  def shower_color
    seconds = (Time.now - self.updated_at).to_i

    if seconds <= GREEN_SECONDS
      return "#D9FF8F"
    elsif seconds > GREEN_SECONDS and seconds <= ORANGE_SECONDS
      return "#FFD48A"
    else
      return "#FF877C"
    end
  end
end
