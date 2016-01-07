class OrdersController < ApplicationController

  # TODO Extrair isso para outro lugar
  #
  PRICES = {
            "P" => 20.0,
            "M" => 31.0,
            "G" => 36.0
            }

  def new
  end

  # Create or update order
  #
  # TODO Melhorar Isso
  def create
    order = Order.where(id: session[:order]["_id"]["$oid"]).first

    if order.blank?
      Order.create(session[:order])
    else
      order.update_attributes(session[:order])
    end

    redirect_to :root
  end

  # Change order status(payed => true)
  #
  def pay
    order = Order.where(id: session[:order]["_id"]["$oid"]).first

    unless order.blank?
      order.update_attributes(payed: true)
    end

    redirect_to :root
  end

  # Add product to JSON
  #
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

  # Add product to JSON through Form(Pizza)
  #
  def add_from_form
    @identifier = rand(1000)

    session[:order]["items"] << {
      id: @identifier,
      name: "Pizza",
      price: PRICES[params[:size]],
      size: params[:size],
      flavors: params[:flavors]
    }

    respond_to :js
  end

  # Remove product from JSON
  #
  def remove
    @id = params[:id].to_i

    session[:order]["items"] = session[:order]["items"].reject { |r| r["id"] == @id }

    respond_to :js
  end
end
