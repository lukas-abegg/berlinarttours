class   Trip
  include Mongoid::Document
  include ActiveModel::MassAssignmentSecurity
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid

  field :name, type: String
  field :description, type: String
  field :type, type: String
  field :guide_email, type: String
  field :duration, type: String
  field :contact, type: String
  field :notes, type: String
  field :meeting_point, type: String
  field :meeting_point_loc, type: Array
  field :transport_type, type: String
  field :stations_viewable, type: String
  field :which_end_point, type: String
  field :end_point, type: String
  field :end_point_loc, type: Array

  has_many :trip_stations

  geocoded_by :meeting_point, :coordinates => :meeting_point_loc
  #geocoded_by :end_point, :coordinates => :end_point_loc

  after_validation :geocode          # auto-fetch coordinates

  def self.search(search_tour)
  if search_tour
    if search_tour[:type] == " "
      @trips = Trip.where( {name: /#{search_tour[:name]}/,
                            guide_email: /#{search_tour[:guide_email]}/}
      )     rescue nil
    else
      @trips = Trip.where( {name: /#{search_tour[:name]}/,
                            guide_email: /#{search_tour[:guide_email]}/,
                            type: /#{search_tour[:type]}/ }
      )     rescue nil
    end

    if @trips.nil?
      Trip.all
    else
      @trips
    end
  else
    Trip.all
  end
    end
  
end
