class GuideToursController < ApplicationController
  before_filter :authenticate_user!
  include ApplicationHelper

  def show
    @guide_tour = GuideTour.new
    @user = current_user
    @profile = Profile.find_by(:email => @user.email)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @guide_tour }
    end
  end

  def search

  end

  def create
    if params[:commit] == "add"
      # addition
      @guide_tour = GuideTour.create(params[:guide_tour])
      @guide_tour.

    elsif params[:commit] == "subtract"
      # subtraction
    elsif params[:commit] == "multiply"
      # multiplication
    else
      @guide_tour = GuideTour.create(params[:guide_tour])

      if @guide_tour.save
        flash[:notice] = "Tour is created"
        redirect_to(:action => "new")
      else
        redirect_to(:action => "new")
      end
    end

    redirect_to(:action => "new")
  end

  def edit
  end

  def new
    @guide_tour = GuideTour.new
    @user = current_user
    @profile = Profile.find_by(:email => @user.email)

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @guide_tour }
      end
  end

  def add_station

  end

end
