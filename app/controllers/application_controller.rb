class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :create_order_session
  
  private
  def create_order_session
    if params[:table_id]
      session[:order] = Order.new(table_id: params[:table_id])
    end
  end
end
