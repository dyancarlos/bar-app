class OrdersController < ApplicationController
  def new
    @order = Order.new
    session[:json] = @order
  end

  def create
    Order.create(session[:json])
    redirect_to :new_order
  end

  def add
    @product    = Product.find(params[:id])
    @identifier = rand(1000)

    session[:json]["items"] << {
      id: @identifier,
      name: @product.name,
      price: @product.price
    }

    respond_to :js
  end

  def remove
    @id = params[:id].to_i

    session[:json]["items"] = session[:json]["items"].reject { |r| r["id"] == @id }

    respond_to :js
  end
end
