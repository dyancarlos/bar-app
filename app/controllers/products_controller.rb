class ProductsController < ApplicationController
  layout "admin", only: :new

  def index
    @products = Product.where(category_id: params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product
      redirect_to :products
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.delete
      redirect_to :products
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
end
