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
    @profile = Profile_Poi.find_by(:email => params[:trip_station][:email]) rescue nil
    if @profile.nil?
      flash[:alert] = "Keine passende Tripstation gefunden!"
      respond_to do |format|
        env["HTTP_REFERER"] += '#body'
        format.html { redirect_to :back }
        format.xml { render :xml => params[:trip_station] }
      end
    else
      @trip_station = TripStation.new(trip_station_params)

      # set attributes from profile
      @trip_station.avatar = @profile.avatar
      @trip_station.profile_bg = @profile.profile_bg
      @trip_station.gallery_pic1 = @profile.gallery_pic1
      @trip_station.gallery_pic2 = @profile.gallery_pic2
      @trip_station.gallery_pic3 = @profile.gallery_pic3
      @trip_station.account_type = @profile.account_type
      @trip_station.poi_type = @profile.poi_type
      @trip_station.description = @profile.description
      @trip_station.mobile = @profile.mobile
      @trip_station.phone = @profile.phone
      @trip_station.street = @profile.street
      @trip_station.house_number = @profile.house_number
      @trip_station.postcode = @profile.postcode
      @trip_station.city = @profile.city
      @trip_station.country = @profile.country
      @trip_station.duration = @profile.country
      @trip_station.duration = @profile.duration

      if @trip_station.save
        #send mail to poi
        @trip = Trip.find_by(:id => @trip_station.trip_id)
        ContactMailer.trip_station_created(@trip, @trip_station).deliver

        respond_to do |format|
          env["HTTP_REFERER"] += '#body'
          format.html { redirect_to :back }
          format.xml { render :xml => @trip_station }
        end
      else
        flash[:alert] = "Tripstation konnte nicht gespeichert werden!"
        respond_to do |format|
          env["HTTP_REFERER"] += '#body'
          format.html { redirect_to :back }
          format.xml { render :xml => @trip_params }
        end
      end
    end
  end

  def update
    @trip_station.update(trip_station_params)

    respond_to do |format|
      env["HTTP_REFERER"] += '#body'
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def destroy
    @trip_station.destroy

    respond_to do |format|
      env["HTTP_REFERER"] += '#body'
      format.html { redirect_to :back }
      format.js
    end
  end

  private
  def set_trip_station
    @trip_station = TripStation.find(params[:id])
  end

  def trip_station_params
    params.require(:trip_station).permit(:name, :email, :trip_id)
  end
end
