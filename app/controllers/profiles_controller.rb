class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @profile = Profile.new
    @profile.account_type = session[:account_type]

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @profile }
    end
  end

  def create
    @profile = Profile.create(params[:profile])

    if @profile.save
      flash[:notice] = "Profile is created"
      redirect_to(:action => "show")
    else
      redirect_to(:action => "new")
    end
  end

  def show
    @user = current_user
    @profile = Profile.find_by(:user_id => @user.id)
    @page_id = params[:page_id]

    @trip_requests = TripRequest.where(tourist_id: @profile.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @profile }
      format.js
    end
  end

  def edit
    @user = current_user
    @profile = Profile.find_by(:user_id => @user.id)
    @profile.account_type = session[:account_type]

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @profile }
    end
  end

  def update
    @profile = Profile.find_by(:user_id => params[:profile][:user_id])
    @profile.update_attributes(profile_params)
      if @profile
        flash[:notice] = "Profile is updated"
        redirect_to profiles_show_path
      else
        redirect_to edit_profile_path
      end
  end

  def search_guides
    @user = current_user
    @profile = Profile.find_by(:user_id => @user.id)

    @trips = Trip.search(params[:search_tour])
    @guides = Profile_Guide.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def contact
    @sender_name = params[:sender_name]
    @sender_email = params[:sender_email]
    @receiver_email = params[:receiver_email]
    @receiver_name = params[:receiver_name]
    @sender_account_type = "Tourist"

    @profile = Profile_Guide.find_by(:email => @receiver_email)
    @trip = Trip.find_by(:id => params[:tour_id])
    @sender_id = params[:sender_id]

    @contact = Contact.new
    @trip_request = TripRequest.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:email, :account_type, :first_name, :last_name, :street, :house_number, :postcode, :city, :country, :user_id, :avatar => [:avatar], :bg_profile => [:bg_profile],
                                    :gallery_pic1 => [:gallery_pic1], :gallery_pic2 => [:gallery_pic2], :gallery_pic3 => [:gallery_pic3])
  end

end
