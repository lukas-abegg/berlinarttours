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
    if !params[:profile_id].blank? && !params[:extern].blank?
      @profile = Profile_Guide.find_by(:id => params[:profile_id])
      @user = User.find_by(:id => @profile.user_id)
      @extern = true
    else
      @user = current_user
      @profile = Profile_Guide.find_by(:user_id => @user.id)
    end

    @trips = Trip.all
    @profile_pois = Profile_Poi.all

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
    params.require(:profile_guide).permit(:email, :account_type, :first_name, :last_name, :description, :experience, :trip_types, :street, :house_number, :postcode, :city, :country, :user_id, :avatar => [:avatar], :bg_profile => [:bg_profile],
                                    :gallery_pic1 => [:gallery_pic1], :gallery_pic2 => [:gallery_pic2], :gallery_pic3 => [:gallery_pic3])
  end

end
