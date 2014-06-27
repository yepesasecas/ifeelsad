class FeelingsController < ApplicationController

  def index
    @feelings = Feeling.all
    respond_to do |format|
      format.json  { render :json => @feelings }
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
