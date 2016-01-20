class CategoriesController < ApplicationController
  layout "admin", only: :new

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category
      redirect_to :categories
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.delete
      redirect_to :categories
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
