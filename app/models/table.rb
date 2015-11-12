class Table
  include Mongoid::Document

  field :customId, type: Integer
  field :seats, type: Integer, default: ->{ 4 }
end
