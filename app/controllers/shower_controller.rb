class ShowerController < ApplicationController
  skip_before_filter :verify_if_session_is_setted

  layout "shower"

  def index
    @type = params[:type]
    orders = Order.all.order_by(created_at: 'desc')

    @orders = orders.select {|d| d.items.delete_if {|c| c["type"] != @type }}
  end
end
