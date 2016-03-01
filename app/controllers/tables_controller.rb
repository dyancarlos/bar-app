class TablesController < ApplicationController
  skip_before_filter :verify_if_session_is_setted

  layout "admin", only: :new

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
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
