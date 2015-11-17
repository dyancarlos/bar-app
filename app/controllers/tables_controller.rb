class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def create
    @table = Table.create(table_params)
    if @table
      redirect_to :tables
    end
  end

  def destroy
    @table = Table.find(params[:id])
    if @table.delete
      redirect_to :tables
    end
  end

  private
  def table_params
    params.require(:table).permit(:customId, :seats)
  end
end
