class Flavor
  include Mongoid::Document

  field :name, type: String
  field :special, type: Boolean, default: ->{ false }
  field :swet, type: Boolean, default: ->{ false }
end
