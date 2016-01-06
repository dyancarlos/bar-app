class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :create_order_session
  before_filter :set_current_table

  helper_method :current_table, :show_buttons

  private
  # Controllers to show buttons on header OR footer
  #
  def show_buttons
    ["categories", "products"]
  end

  # Define order session
  #
  def create_order_session
    if params[:table_id]
      session[:order] = already_have_order?(params[:table_id])
    end
  end

  # Verify if table already have a not payed order
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

  # SET the current table custom ID
  #
  def set_current_table
    session[:custom_id] = params[:custom_id] if params[:custom_id]
  end

  # GET the current table custom ID
  #
  def current_table
    session[:custom_id]
  end
end
