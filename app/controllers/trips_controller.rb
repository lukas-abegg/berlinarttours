class TripsController < ApplicationController
  require 'will_paginate/array'
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

    @profile_external = Profile.where(:user_id => current_user.id)
    if !@profile_external.blank?
      @trip_requests = TripRequest.where(:trip_id => @trip.id, :tourist_id => @profile_external.first.id)
    end

    @trip_js = @trip.to_json
    @trip_stations_js = @trip.trip_stations.to_json

    respond_with(@trip)
  end

  def show
    @user = current_user
    @profile = Profile_Guide.find_by(:email => @user.email)

    @search_results = []
    if params[:search_poi]
      @search_results = Profile_Poi.search(params[:search_poi])
      if not @search_results.nil?
        @search_results = @search_results.limit(6)
      end
    end

    #delete station if used
    if params[:delete_station]
      @trip_station = TripStation.find(params[:delete_station])
      @trip_station.destroy
    end

    #add stations
    if params[:add_stations]
      @stations =  params[:add_stations]
      @trip_id =  params[:trip_id]

      @stations.each do |station|
        create_trip_station(@trip_id, station)
      end
    end

    @trip_station = TripStation.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @trip }
      format.js
    end

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
    params.require(:trip).permit(:name, :description, :type, :guide_email, :contact, :duration, :notes, :meeting_point, :meeting_point_loc, :transport_type, :end_point, :end_point_loc)
  end

  def create_trip_station(trip_id, station_id)
    @profile = Profile_Poi.find(station_id) rescue nil

    if @profile.nil?
      puts "Keine passende Tripstation gefunden!"
    else
      @trip_station = TripStation.new

      # set attributes from profile
      @trip_station.name = @profile.name
      @trip_station.email = @profile.email
      @trip_station.trip_id = trip_id
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


      puts @trip_station.city

      if @trip_station.save
        #send mail to poi
        @trip = Trip.find_by(:id => @trip_station.trip_id)
        ContactMailer.trip_station_created(@trip, @trip_station).deliver
      else
        puts "Tripstation konnte nicht gespeichert werden!"

      end
    end
  end
end
