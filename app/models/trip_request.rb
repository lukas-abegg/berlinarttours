class TripRequest
  include Mongoid::Document

  field :trip_id, type: String
  field :trip_name, type: String
  field :guide_name, type: String
  field :guide_email, type: String
  field :tourist_id, type: String
  field :tourist_name, type: String

  field :request_descr, type: String
  field :who_wants, type: String
  field :date, type: String
  field :start, type: Time
  field :end, type: Time
  field :notes, type: String

  field :request_status, type: String, default: "open"

end
