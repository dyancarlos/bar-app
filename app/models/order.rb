class Order
  include Mongoid::Document

  belongs_to :table

  field :payed, type: Boolean, default: ->{ false }
  field :created_at, type: DateTime, default: ->{ Time.now }
  field :items, type: Array, default: -> { [] }
  field :table_id, type: Table
end
