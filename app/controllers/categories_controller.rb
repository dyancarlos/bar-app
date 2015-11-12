class CategoriesController < ApplicationController
  def index
    @categories = Category.all
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
