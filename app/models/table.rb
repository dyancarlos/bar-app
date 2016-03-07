class Table
  include Mongoid::Document

  has_many :orders

  field :customId, type: Integer
  field :seats, type: Integer, default: ->{ 4 }

  # Return the table color
  #
  def return_table_color
    unless self.orders.blank?
      unless self.orders.last.payed
        return "#B02B2C"
      end
    end
    return "#72BCCB"
  end
end
