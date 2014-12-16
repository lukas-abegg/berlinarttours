class GuideHomeController < ApplicationController
  include ApplicationHelper

  def index
    session[:account_type] = "guide"
  end

end
