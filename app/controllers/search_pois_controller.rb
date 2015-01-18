class SearchPoisController < ApplicationController

  def index
    if params[:search_poi].present?
      @pois = Profile_Poi.search(params[:search_poi])
    end
  end

end
