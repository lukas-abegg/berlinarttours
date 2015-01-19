class Trip
  include Mongoid::Document
  include ActiveModel::MassAssignmentSecurity
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :type, type: String
  field :guide_email, type: String
  field :duration, type: String
  field :contact, type: String
  field :notes, type: String
  field :meeting_point, type: String

  has_many :trip_stations

  def self.search(search_tour)
  if search_tour
    @trips = Trip.where( name: /#{search_tour[:name]}/,
                         guide_email: /#{search_tour[:guide_email]}/,
                         type: /#{search_tour[:type]}/
    )     rescue nil

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
