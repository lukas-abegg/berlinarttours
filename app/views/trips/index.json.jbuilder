json.array!(@trips) do |trip|
  json.extract! trip, :id, :name, :description, :type, :guide_email, :duration, :notes, :contact, :meeting_point
  json.url trip_url(trip, format: :json)
end
