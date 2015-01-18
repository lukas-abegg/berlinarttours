class SearchTripsController < ApplicationController

  def index
    if params[:search_poi]
      @pois = Profile_Poi.search(params[:search_poi])
    end
  end

end
