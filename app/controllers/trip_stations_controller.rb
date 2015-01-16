class TripStationsController < ApplicationController
  before_action :set_trip_station, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @trip_stations = TripStation.all
    respond_with(@trip_stations)
  end

  def show
    respond_with(@trip_station)
  end

  def new
    @trip_station = TripStation.new
    respond_with(@trip_station)
  end

  def edit
  end

  def create

    @trip_station = TripStation.new(trip_station_params)

    if @trip_station.save
      respond_to do |format|
        format.html { redirect_to trip_url(@trip_station.trip_id)}
        format.xml { render :xml => @trip_station }
      end
    end
  end

  def update
    @trip_station.update(trip_station_params)
    respond_with(@trip_station)
  end

  def destroy
    @trip_station.destroy
    respond_with(@trip_station)
  end

  private
    def set_trip_station
      @trip_station = TripStation.find(params[:id])
    end

    def trip_station_params
      params.require(:trip_station).permit(:name, :email, :trip_id)
    end
end
