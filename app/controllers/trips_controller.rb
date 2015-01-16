class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @trips = Trip.all
    respond_with(@trips)
  end

  def show
    @user = current_user
    @profile = Profile.find_by(:email => @user.email)

    @trip_station = TripStation.new
    respond_with(@trip)
  end

  def new
    @user = current_user
    @profile = Profile.find_by(:email => @user.email)

    @trip = Trip.new
    respond_with(@trip)
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.save
    respond_with(@trip)
  end

  def update
    @trip.update(trip_params)
    respond_with(@trip)
  end

  def destroy
    @trip.destroy
    respond_with(@trip)
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:name, :description, :type, :guide_email, :duration, :notes, :meeting_point)
    end
end
