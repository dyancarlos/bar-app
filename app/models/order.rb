class Order
  include Mongoid::Document

  belongs_to :table

  field :payed, type: Boolean, default: ->{ false }
  field :created_at, type: DateTime, default: ->{ Time.now }
  field :items, type: Array, default: -> { [] }

  # TODO ONLY FOR TESTS
  #
  FLAVORS = %w(atum bacon calabresa coração frango mussarela palmito portuguesa espanhola milho lombinho gasosaria italiana filé camarão picanha gaúcha salmão
              califórnia chocolate sensação prestígio beijinho mms)
end
