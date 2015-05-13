class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @user = current_user
    @profile = Profile_Guide.find_by(:email => @user.email)

    if  !(Trip.find_by(:guide_email => @profile.email) rescue nil).nil?
      @trips = Trip.where(:guide_email => @profile.email)
    end

    respond_with(@trips)
  end

  def show_external
    @trip = Trip.find_by(:id => params[:id])
    @profile = Profile_Guide.find_by(:email => @trip.guide_email)

    @trip_js = @trip.to_json
    @trip_stations_js = @trip.trip_stations.to_json

    respond_with(@trip)
  end

  def show
    @user = current_user
    @profile = Profile_Guide.find_by(:email => @user.email)

    if params[:search]
      @search_results = Profile_Poi.find_by(:name => params[:search]) #.order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    end

    @trip_station = TripStation.new

    respond_with(@trip, @search_results)

  end

  def new
    @user = current_user
    @profile = Profile_Guide.find_by(:user_id => @user.id)

    @trip = Trip.new
    @trip.guide_email = @profile.email

    respond_with(@trip)
  end

  def edit
    @user = current_user
    @profile = Profile_Guide.find_by(:user_id => @user.id)

    respond_with(@trip)
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.save
    respond_with(@trip)
  end

  def update
    @trip.update(params[:trip])
    respond_with(@trip)
  end

  def destroy
    @trip.destroy
    respond_with(@trip)
  end

  def search_poi
    if params[:search_poi]
      @pois = Profile_Guide.search(params[:search_poi])
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private
  def set_trip
    if @trip.nil?
      @trip = Trip.find(params[:id])
    end
  end

  def trip_params
    params.require(:trip).permit(:name, :description, :type, :guide_email, :contact, :duration, :notes, :meeting_point, :meeting_point_loc, :transport_type)
  end
end
