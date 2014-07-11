class CountriesController < ApplicationController
  def index
    @countries = Country.countries_json
    respond_to do |format|
      format.json  { render :json => @countries }
    end
  end
end