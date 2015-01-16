class GuideTour
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  has_many :stations, :dependent => :destroy
    accepts_nested_attributes_for :stations

  field :tour_name, type: String
  field :description, type: String
  field :tour_type, type: String
  field :guide_email, type: String
  field :duration, type: Time
  field :notes, type: String
  field :meeting_point, type: String
  field :street, type: String
  field :house_number, type: Integer
  field :postcode, type: Integer
  field :city, type: String
  field :country, type: String

end
