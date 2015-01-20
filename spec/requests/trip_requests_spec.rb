require 'rails_helper'

RSpec.describe "TripRequests", :type => :request do
  describe "GET /trip_requests" do
    it "works! (now write some real specs)" do
      get trip_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
