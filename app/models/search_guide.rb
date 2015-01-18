class Search_Guide
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :postcode, type: Integer
  field :city, type: String
  field :country, type: String

end