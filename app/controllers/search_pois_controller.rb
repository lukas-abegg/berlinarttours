class SearchPoisController < ApplicationController

  def index
    if params[:search_poi]
      @pois = Profile.search(params[:search_poi])
    end
  end

end
