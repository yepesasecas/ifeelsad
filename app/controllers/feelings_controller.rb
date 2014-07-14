class FeelingsController < ApplicationController

  def index
    @count    = Feeling.count
    @feelings = Feeling.with_message.last 10
    @response = {"count" => @count, 
                  "last" => @feelings}

    respond_to do |format|
      format.json  { render json: @response }
    end
  end

  def create
    @feeling = Feeling.create feeling_params
    country  = Country.find_by_code(@feeling.country_code)
    data     = { sads:         Feeling.count,
                 last_feeling: @feeling
               }
    
    @feeling.update_attributes country_id: country.id
    PusherModule.notify_visitors_new_feeling(data)

    respond_to do |format|
      format.json  { render :json => @feeling }
    end
  end

  private
  def feeling_params
    params.require(:feeling).permit(:sad, :ip, :country_name, :country_code, :message)
  end
end
