require 'rails_helper'

RSpec.describe "trip_requests/index", :type => :view do
  before(:each) do
    assign(:trip_requests, [
      TripRequest.create!(
        :trip_id => "",
        :tourist_id => "",
        :request_descr => "Request Descr",
        :who_wants => "Who Wants",
        :when => "When",
        :notes => "Notes"
      ),
      TripRequest.create!(
        :trip_id => "",
        :tourist_id => "",
        :request_descr => "Request Descr",
        :who_wants => "Who Wants",
        :when => "When",
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of trip_requests" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Request Descr".to_s, :count => 2
    assert_select "tr>td", :text => "Who Wants".to_s, :count => 2
    assert_select "tr>td", :text => "When".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
