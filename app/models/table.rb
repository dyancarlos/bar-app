class Table
  include Mongoid::Document

  has_many :orders

  field :customId, type: Integer
  field :seats, type: Integer, default: ->{ 4 }
end
