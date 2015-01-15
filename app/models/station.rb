class Station
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :guide_tour

  field :name, type: String
  field :email, type: String

end
