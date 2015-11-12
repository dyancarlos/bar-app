class ProductsController < ApplicationController
  def index
    @products = Product.all
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
