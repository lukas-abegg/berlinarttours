class Trip
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :type, type: String
  field :guide_email, type: String
  field :duration, type: Time
  field :contact, type: String
  field :notes, type: String
  field :meeting_point, type: String

  has_many :trip_stations
end
