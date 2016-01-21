class FlavorsController < ApplicationController
  layout "admin", only: [:new, :edit]

  def new
    @flavor  = Flavor.new
    @flavors = Flavor.all.order(name: 1)
  end

  def edit
    @flavor = Flavor.find(params[:id])
  end

  def update
    @flavor = Flavor.find(params[:id])
    if @flavor.update_attributes(flavor_params)
      redirect_to :new_flavor
    end
  end

  def create
    @flavor = Flavor.create(flavor_params)
    if @flavor
      redirect_to :new_flavor
    end
  end

  def destroy
    @flavor = Flavor.find(params[:id])
    if @flavor.destroy
      redirect_to :new_flavor
    end
  end

  private
  def flavor_params
    params.require(:flavor).permit(:name, :special, :swet)
  end
end
