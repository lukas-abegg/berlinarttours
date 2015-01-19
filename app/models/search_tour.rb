class Search_Tour
  include Mongoid::Document
  include Mongoid::Timestamps

  field :guide_email, type: String
  field :name, type: String
  field :type, type: String

end