class OrdersController < ApplicationController

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
      price: @product.price,
      type: @product.category.name
    }

    respond_to :js
  end

  # Add product to JSON through Form(Pizza)
  #
  def add_from_form
    @identifier = rand(1000)

    session[:order]["items"] << {
      id: @identifier,
      name: "Pizza #{'com borda' if params[:border]}",
      price: Order.calculate_price(params[:size], params[:border], params[:special]),
      size: params[:size],
      flavors: params[:flavors],
      type: "Pizza"
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
