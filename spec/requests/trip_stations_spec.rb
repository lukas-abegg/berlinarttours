require 'rails_helper'

RSpec.describe "TripStations", :type => :request do
  describe "GET /trip_stations" do
    it "works! (now write some real specs)" do
      get trip_stations_path
      expect(response).to have_http_status(200)
    end
  end
end
