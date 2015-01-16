require 'rails_helper'

RSpec.describe "trip_stations/show", :type => :view do
  before(:each) do
    @trip_station = assign(:trip_station, TripStation.create!(
      :name => "Name",
      :email => "Email",
      :trip_station_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
  end
end
