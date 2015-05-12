class ProfileGuidesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @profile = Profile_Guide.new
    @profile.account_type = session[:account_type]

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @profile }
    end
  end

  def create
    @profile = Profile_Guide.create(params[:profile_guide])

    if @profile.save
      flash[:notice] = "Profile is created"
      redirect_to(:action => "show")
    else
      redirect_to(:action => "new")
    end
  end

  def show
    if !params[:extern].blank?
      if !params[:profile_id].blank?
        @profile = Profile_Guide.find_by(:id => params[:profile_id])
        @user = User.find_by(:id => @profile.user_id)
        @extern = true
      else
        @profile = Profile_Guide.find_by(:email => params[:email])
        @user = User.find_by(:id => @profile.user_id)
        @extern = true
      end
    else
      @user = current_user
      @profile = Profile_Guide.find_by(:user_id => @user.id)
    end

    @trips = Trip.where(guide_email: @profile.email)
    @trip_requests = TripRequest.where(guide_email: @profile.email)

    @trips_open = @trip_requests.where(:request_status => "open")
    @trips_open_js = @trips_open.to_json

    #open
    @trips_open_basicData = []
    @trips_open_tourist = []
    @trips_open.each_with_index do |request,index|
      @trips_open_basicData.push(@trips.where(:id => request.trip_id))
      @tourist = Profile.find_by( :id => request.tourist_id)
      @trips_open_tourist.push(@tourist)
    end
    @trips_open_basicData_js = @trips_open_basicData.to_json
    @trips_open_tourist_js = @trips_open_tourist.to_json

    #accepted
    @trips_booked = @trip_requests.where(:request_status => "accepted")
    @trips_booked_js = @trips_booked.to_json

    @trips_booked_basicData = []
    @trips_booked_tourist = []
    @trips_booked.each_with_index do |request,index|
      @trips_booked_basicData.push(@trips.where(:id => request.trip_id))
      @tourist = Profile.find_by( :id => request.tourist_id)
      @trips_booked_tourist.push(@tourist)
    end
    @trips_booked_basicData_js = @trips_booked_basicData.to_json
    @trips_booked_tourist_js = @trips_booked_tourist.to_json


    @page_id = params[:page_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @profile }
      format.js
    end
  end

  def edit
    @user = current_user
    @profile = Profile_Guide.find_by(:user_id => @user.id)
    @profile.account_type = session[:account_type]

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @profile }
    end
  end

  def update
    @profile = Profile_Guide.find_by(:user_id => params[:profile_guide][:user_id])
    @profile.update(params[:profile_guide])
      if @profile
        flash[:notice] = "Profile is updated"
        redirect_to profile_guides_show_path
      else
        redirect_to profile_guides_edit_path
      end
  end

  def profile_params
    params.require(:profile_guide).permit(:email, :account_type, :first_name, :last_name, :description, :experience, :trip_types, :mobile, :phone, :street, :house_number, :postcode, :city, :country, :location, :user_id, :avatar => [:avatar], :bg_profile => [:bg_profile],
                                    :gallery_pic1 => [:gallery_pic1], :gallery_pic2 => [:gallery_pic2], :gallery_pic3 => [:gallery_pic3])
  end

end
