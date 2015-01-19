class Search_Poi
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :email, type: String
  field :name, type: String
  field :poi_type, type: String

  field :postcode, type: Integer
  field :city, type: String
  field :country, type: String

end