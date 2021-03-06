require 'rails_helper'

RSpec.describe "trip_requests/new", :type => :view do
  before(:each) do
    assign(:trip_request, TripRequest.new(
      :trip_id => "",
      :tourist_id => "",
      :request_descr => "MyString",
      :who_wants => "MyString",
      :when => "MyString",
      :notes => "MyString"
    ))
  end

  it "renders new trip_request form" do
    render

    assert_select "form[action=?][method=?]", trip_requests_path, "post" do

      assert_select "input#trip_request_trip_id[name=?]", "trip_request[trip_id]"

      assert_select "input#trip_request_tourist_id[name=?]", "trip_request[tourist_id]"

      assert_select "input#trip_request_request_descr[name=?]", "trip_request[request_descr]"

      assert_select "input#trip_request_who_wants[name=?]", "trip_request[who_wants]"

      assert_select "input#trip_request_when[name=?]", "trip_request[when]"

      assert_select "input#trip_request_notes[name=?]", "trip_request[notes]"
    end
  end
end
