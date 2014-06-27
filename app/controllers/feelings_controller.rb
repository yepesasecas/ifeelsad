class FeelingsController < ApplicationController

  def index
    @feeling = Feeling.new sad: true
    respond_to do |format|
      format.json  { render :json => @feeling }
    end
  end

  def create
    @feeling = Feeling.create feeling_params
    respond_to do |format|
      format.json  { render :json => @feeling }
    end
  end

  private
  def feeling_params
    params.require(:feeling).permit(:sad, :ip, :country_name, :country_code)
  end
end
