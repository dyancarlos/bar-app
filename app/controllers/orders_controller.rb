class OrdersController < ApplicationController
  def new
#    @order = Order.new
#    session[:json] = @order
  end

  def create
    Order.create(session[:order])
    redirect_to :tables
  end

  def add
    @product    = Product.find(params[:id])
    @identifier = rand(1000)

    session[:order]["items"] << {
      id: @identifier,
      name: @product.name,
      price: @product.price
    }

    respond_to :js
  end

  def remove
    @id = params[:id].to_i

    session[:order]["items"] = session[:order]["items"].reject { |r| r["id"] == @id }

    respond_to :js
  end
end
