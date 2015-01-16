require 'rails_helper'

RSpec.describe "trip_stations/index", :type => :view do
  before(:each) do
    assign(:trip_stations, [
      TripStation.create!(
        :name => "Name",
        :email => "Email",
        :trip_station_id => 1
      ),
      TripStation.create!(
        :name => "Name",
        :email => "Email",
        :trip_station_id => 1
      )
    ])
  end

  it "renders a list of trip_stations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
