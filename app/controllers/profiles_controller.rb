class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @profile = Profile.new
    @profile.account_type = session[:account_type]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  def create
    @profile = Profile.create(params[:profile])

    if @profile.save
      flash[:notice] =  "Profile is created"
      redirect_to(:action => "show")
    else
      redirect_to(:action => "new")
    end
  end

  def show
    @user = current_user
    @profile = Profile.find_by(:email => @user.email)
    @page_id = params[:page_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile }
      format.js
    end
  end

  def edit
    @user = current_user
    @profile = Profile.find_by(:email => @user.email)
    @profile.account_type = session[:account_type]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  def update
    @profile = Profile.update(params[:profile])

    if @profile
      flash[:notice] =  "Profile is updated"
      redirect_to profiles_show_path
    else
      redirect_to edit_profile_path
    end
  end

end
