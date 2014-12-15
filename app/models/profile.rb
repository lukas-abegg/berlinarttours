class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::Attributes::Dynamic


  has_mongoid_attached_file :avatar, :styles => { :medium => "500x500>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_mongoid_attached_file :profile_bg, :styles => { :medium => "1920x1280", :thumb => "1920x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_bg, :content_type => /\Aimage\/.*\Z/


  field :email, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :street, type: String
  field :house_number, type: Integer
  field :postcode, type: Integer
  field :city, type: String
  field :country, type: String
end
