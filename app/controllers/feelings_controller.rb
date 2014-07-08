class FeelingsController < ApplicationController

  def index
    @feelings = Country.countries_json
    respond_to do |format|
      format.json  { render :json => @feelings }
    end
  end

  def create
    @feeling = Feeling.create feeling_params
    country  = Country.find_by_code(@feeling.country_code)
    data     = { message: 'pusher working!', 
                    sads: Feeling.count }
    
    @feeling.update_attributes country_id: country.id
    PusherModule.notify_visitors_new_feeling(data)

    respond_to do |format|
      format.json  { render :json => @feeling }
    end
  end

  private
  def feeling_params
    params.require(:feeling).permit(:sad, :ip, :country_name, :country_code)
  end
end
