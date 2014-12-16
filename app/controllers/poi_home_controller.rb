class PoiHomeController < ApplicationController
  include ApplicationHelper

  def index
    session[:account_type] = "poi"
  end

end
