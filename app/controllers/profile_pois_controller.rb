class ProfilePoisController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @profile = Profile_Poi.new
    @profile.account_type = session[:account_type]

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @profile }
    end
  end

  def create
    @profile = Profile_Poi.create(params[:profile_poi])


    if @profile.save
      flash[:notice] = "Profile is created"
      redirect_to(:action => "show")
    else
      redirect_to(:action => "new")
    end
  end

  def show
    if !params[:email].blank? && !params[:extern].blank?
      @profile = Profile_Poi.find_by(:email => params[:email])
      @user = User.find_by(:id => @profile.user_id)
      @extern = true
    else
      @user = current_user
      @profile = Profile_Poi.find_by(:user_id => @user.id)
    end

    @trip_stations = TripStation.where(:email => @profile.email).pluck(:trip_id)
    @trips = Trip.find(@trip_stations)

    @page_id = params[:page_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @profile }
      format.js
    end
  end

  def edit
    @user = current_user
    @profile = Profile_Poi.find_by(:user_id => @user.id)
    @profile.account_type = session[:account_type]

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @profile }
    end
  end

  def update
    @profile = Profile_Poi.find_by(:user_id => params[:profile_poi][:user_id])
    @profile.update_attributes(profile_params)

    if @profile
      flash[:notice] = "Profile is updated"
      redirect_to profile_pois_show_path
    else
      redirect_to profile_pois_edit_path
    end
  end

  def search_guides
    @user = current_user
    @profile = Profile_Poi.find_by(:user_id => @user.id)

    @guides = Profile_Guide.search(params[:search_guide])

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
    @sender_account_type = "POI"
    @profile_guide = Profile_Guide.find_by(:email => @receiver_email)

    @contact = Contact.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def profile_params
    params.require(:profile_poi).permit(:email, :account_type, :first_name, :last_name, :street, :house_number, :postcode, :city, :country, :user_id, :avatar => [:avatar], :bg_profile => [:bg_profile],
                                        :gallery_pic1 => [:gallery_pic1], :gallery_pic2 => [:gallery_pic2], :gallery_pic3 => [:gallery_pic3])
  end

end
