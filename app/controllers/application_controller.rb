class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :create_order_session
  
  private
  # define order session
  #
  def create_order_session
    if params[:table_id]
      session[:order] = already_have_order?(params[:table_id])
    end
  end
  
  # verify if table already have a not payed order
  #
  def already_have_order?(table_id)
    table = Table.where(id: table_id).first
    
    unless table.orders.blank?
      unless table.orders.last.payed
        return table.orders.last
      end
    end
    return Order.new(table_id: table_id)
  end
end
