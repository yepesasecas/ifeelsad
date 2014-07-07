class LandingController < ApplicationController
  def index
    @sads = Feeling.count
  end
end
