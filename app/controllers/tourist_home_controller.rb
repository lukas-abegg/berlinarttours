class TouristHomeController < ApplicationController
  include ApplicationHelper

  def index
    session[:account_type] = "tourist"
  end

end
