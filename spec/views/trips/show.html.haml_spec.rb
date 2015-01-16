require 'rails_helper'

RSpec.describe "trips/show", :type => :view do
  before(:each) do
    @trip = assign(:trip, Trip.create!(
      :name => "Name",
      :description => "Description",
      :type => "Type",
      :guide_email => "Guide Email",
      :notes => "Notes",
      :meeting_point => "Meeting Point"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Guide Email/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/Meeting Point/)
  end
end
