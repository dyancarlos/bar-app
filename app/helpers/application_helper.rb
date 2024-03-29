module ApplicationHelper
  # Count all itens in summary
  #
  def count_items
    session[:order]["items"].size
  end

  def special?(obj)
    "special" if obj
  end

  def swet?(obj)
    "swet" if obj
  end

  # Convert to Reais
  #
  def reais(value)
    number_to_currency(value, unit: "R$ ", separator: ",", delimiter: "")
  end

  def back_link(path)
    return link_to "<i class='material-icons'>skip_previous</i>".html_safe, path, class: "back-link absolute-left"
  end

  def set_active(type)
    "active" if params[:category] == type
  end
end
