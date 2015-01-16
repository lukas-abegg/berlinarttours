require 'rails_helper'

RSpec.describe "trip_stations/edit", :type => :view do
  before(:each) do
    @trip_station = assign(:trip_station, TripStation.create!(
      :name => "MyString",
      :email => "MyString",
      :trip_station_id => 1
    ))
  end

  it "renders the edit trip_station form" do
    render

    assert_select "form[action=?][method=?]", trip_station_path(@trip_station), "post" do

      assert_select "input#trip_station_name[name=?]", "trip_station[name]"

      assert_select "input#trip_station_email[name=?]", "trip_station[email]"

      assert_select "input#trip_station_trip_station_id[name=?]", "trip_station[trip_station_id]"
    end
  end
end
