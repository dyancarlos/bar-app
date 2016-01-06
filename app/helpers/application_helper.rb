module ApplicationHelper
  # Count all itens in summary
  #
  def count_items
    session[:order]["items"].size
  end
end
