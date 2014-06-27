class FeelingsController < ApplicationController

  def index
    @feeling = Feeling.new sad: true
    respond_to do |format|
      format.json  { render :json => @feeling }
    end
  end
end
