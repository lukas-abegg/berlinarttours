class Search_Poi
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :email, type: String
  field :account_type, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :street, type: String
  field :house_number, type: Integer
  field :postcode, type: Integer
  field :city, type: String
  field :country, type: String

end