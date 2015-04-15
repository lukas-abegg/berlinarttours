json.array!(@trip_requests) do |trip_request|
  json.extract! trip_request, :id, :trip_id, :tourist_id, :request_descr, :who_wants, :date, :start, :end, :notes
  json.url trip_request_url(trip_request, format: :json)
end
