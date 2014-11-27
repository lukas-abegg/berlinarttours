class TouristHomeController < ApplicationController
  include ApplicationHelper

  def index
    @users = User.all
  end
end
