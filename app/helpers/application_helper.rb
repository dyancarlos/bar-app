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
end
