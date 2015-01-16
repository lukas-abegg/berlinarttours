require 'rails_helper'

RSpec.describe "trips/new", :type => :view do
  before(:each) do
    assign(:trip, Trip.new(
      :name => "MyString",
      :description => "MyString",
      :type => "",
      :guide_email => "MyString",
      :notes => "MyString",
      :meeting_point => "MyString"
    ))
  end

  it "renders new trip form" do
    render

    assert_select "form[action=?][method=?]", trips_path, "post" do

      assert_select "input#trip_name[name=?]", "trip[name]"

      assert_select "input#trip_description[name=?]", "trip[description]"

      assert_select "input#trip_type[name=?]", "trip[type]"

      assert_select "input#trip_guide_email[name=?]", "trip[guide_email]"

      assert_select "input#trip_notes[name=?]", "trip[notes]"

      assert_select "input#trip_meeting_point[name=?]", "trip[meeting_point]"
    end
  end
end
