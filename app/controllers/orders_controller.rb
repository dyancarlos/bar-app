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
    product = Product.find(params[:id])

    session[:json]["items"] << {
      id: product.id,
      name: product.name,
      price: product.price
    }

    render nothing: true
  end
end
