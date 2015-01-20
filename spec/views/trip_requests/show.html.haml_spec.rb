require 'rails_helper'

RSpec.describe "trip_requests/show", :type => :view do
  before(:each) do
    @trip_request = assign(:trip_request, TripRequest.create!(
      :trip_id => "",
      :tourist_id => "",
      :request_descr => "Request Descr",
      :who_wants => "Who Wants",
      :when => "When",
      :notes => "Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Request Descr/)
    expect(rendered).to match(/Who Wants/)
    expect(rendered).to match(/When/)
    expect(rendered).to match(/Notes/)
  end
end
