class SearchPoisController < ApplicationController

  def index
    @user = current_user
    @profile = Profile_Guide.find_by(:user_id => @user.id)

    if params[:search_poi].present?
      @pois = Profile_Poi.search(params[:search_poi])
    end
  end

  def contact
    @sender_name = params[:sender_name]
    @sender_email = params[:sender_email]
    @receiver_email = params[:receiver_email]
    @receiver_name = params[:receiver_name]
    @sender_account_type = "Guide"
    @profile_poi = Profile_Poi.find_by(:email => @receiver_email)

    @contact = Contact.new

    respond_to do |format|
      format.html
      format.js
    end
  end

end
