class FlavorsController < ApplicationController
  layout "admin", only: :new

  def new
    @flavor = Flavor.new
  end

  def create
    @flavor = Flavor.create(flavor_params)
    if @flavor
      redirect_to :new_flavor
    end
  end

  private
  def flavor_params
    params.require(:flavor).permit(:name)
  end
end
