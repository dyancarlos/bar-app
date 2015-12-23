class SummariesController < ApplicationController
  def index
    @summaries = session[:order]
  end
end
