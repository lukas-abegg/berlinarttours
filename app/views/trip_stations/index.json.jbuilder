json.array!(@trip_stations) do |trip_station|
  json.extract! trip_station, :id, :name, :email, :trip_id
  json.url trip_station_url(trip_station, format: :json)
end
