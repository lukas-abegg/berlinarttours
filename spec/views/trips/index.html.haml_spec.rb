require 'rails_helper'

RSpec.describe "trips/index", :type => :view do
  before(:each) do
    assign(:trips, [
      Trip.create!(
        :name => "Name",
        :description => "Description",
        :type => "Type",
        :guide_email => "Guide Email",
        :notes => "Notes",
        :meeting_point => "Meeting Point"
      ),
      Trip.create!(
        :name => "Name",
        :description => "Description",
        :type => "Type",
        :guide_email => "Guide Email",
        :notes => "Notes",
        :meeting_point => "Meeting Point"
      )
    ])
  end

  it "renders a list of trips" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Guide Email".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => "Meeting Point".to_s, :count => 2
  end
end
