class ShowerController < ApplicationController
  skip_before_filter :verify_if_session_is_setted

  layout "shower"

  def index
    @type = params[:type]
    orders = Order.all.order_by(created_at: 'desc')

    if @type == "Pizzas"
      @orders = orders.select {|d| d.items.delete_if {|c| c["type"] == "Bebidas" or c["type"] == "Petiscos"}}
    end

    if @type == "Bebidas"
      @orders = orders.select {|d| d.items.delete_if {|c| c["type"] != "Bebidas"}}
    end

    if @type == "Petiscos"
      @orders = orders.select {|d| d.items.delete_if {|c| c["type"] != "Petiscos"}}
    end
  end
end
