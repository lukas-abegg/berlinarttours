class TripStation
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :trip_id, type: Integer

  belongs_to  :trip
end
