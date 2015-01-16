require "rails_helper"

RSpec.describe TripStationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trip_stations").to route_to("trip_stations#index")
    end

    it "routes to #new" do
      expect(:get => "/trip_stations/new").to route_to("trip_stations#new")
    end

    it "routes to #show" do
      expect(:get => "/trip_stations/1").to route_to("trip_stations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trip_stations/1/edit").to route_to("trip_stations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trip_stations").to route_to("trip_stations#create")
    end

    it "routes to #update" do
      expect(:put => "/trip_stations/1").to route_to("trip_stations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trip_stations/1").to route_to("trip_stations#destroy", :id => "1")
    end

  end
end
