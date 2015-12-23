class OrdersController < ApplicationController
  def new
  end

  def create
    order = Order.where(id: session[:order]["_id"]["$oid"]).first

    if order.blank?
      Order.create(session[:order])
    else
      order.update_attributes(session[:order])
    end

    redirect_to :root
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
