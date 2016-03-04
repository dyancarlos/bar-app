class OrdersController < ApplicationController

  skip_before_filter :verify_if_session_is_setted, only: :get_all_orders

  def new
    render json: session[:order]
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

  def pay
    order = Order.where(id: session[:order]["_id"]["$oid"]).first

    unless order.blank?
      order.update_attributes(payed: true)
    end

    redirect_to :root
  end

  def add_other
    @product    = Product.find(params[:product_id])
    @identifier = rand(1000)

    session[:order]["items"] << {
      id:           @identifier,
      name:         @product.name,
      price:        @product.price,
      quantity:     params[:quantity].to_i,
      type:         @product.category.name,
      observation:  manipulate_options_product(params[:observation], params[:options])
    }

    redirect_to "/products?id=#{@product.category.id}"
  end

  def add_pizza
    @identifier = rand(1000)

    session[:order]["items"] << {
      id:          @identifier,
      name:        "Pizza#{' com borda' if params[:border]}",
      price:       Order.calculate_price(params[:size], params[:border], params[:special]),
      quantity:    1,
      type:        "Pizzas",
      size:        params[:size],
      flavors:     params[:flavors],
      observation: params[:observation]
    }

    respond_to :js
  end

  def remove
    @id = params[:id].to_i
    session[:order]["items"] = session[:order]["items"].reject { |r| r["id"] == @id }

    respond_to :js
  end

  def add_quantity
    @id       = params[:id].to_i
    @quantity = session[:order]["items"].detect {|a| a["id"] == @id}["quantity"]
    session[:order]["items"].detect {|a| a["id"] == @id}["quantity"] += 1

    respond_to :js
  end

  def remove_quantity
    @id       = params[:id].to_i
    @quantity = session[:order]["items"].detect {|a| a["id"] == @id}["quantity"]
    unless @quantity == 1
      session[:order]["items"].detect {|a| a["id"] == @id}["quantity"] -= 1
    end

    respond_to :js
  end

  private
  def manipulate_options_product(observation, options)
    content = []
    options.blank?     ? nil : (content = content + options)
    observation.blank? ? nil : (content << observation)
    return content
  end
end
