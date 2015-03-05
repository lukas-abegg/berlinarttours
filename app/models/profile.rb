class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Geocoder::Model::Mongoid

  has_mongoid_attached_file :avatar, :styles => { :medium => "500x500>", :thumb => "200x200>" }, cascade_callbacks: true
  do_not_validate_attachment_file_type :avatar

  has_mongoid_attached_file :profile_bg, :styles => { :medium => "1920x1280", :thumb => "1920x300>" }, cascade_callbacks: true
  do_not_validate_attachment_file_type :profile_bg


  field :email, type: String
  field :account_type, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :mobile, type: String
  field :phone, type: String
  field :street, type: String
  field :house_number, type: Integer
  field :postcode, type: Integer
  field :city, type: String
  field :country, type: String

  field :location, type: Array

  field :user_id, type: Integer

  belongs_to :user

  geocoded_by :address, :coordinates => :location

  after_validation :geocode          # auto-fetch coordinates

  def address
    [street, house_number, postcode, city, country].compact.join(', ')
  end

  def self.search(search_tourist)
    if search_tourist[:first_name]
      Profile.where({first_name: /#{search_tourist[:first_name]}/,
                     account_type: search_tourist[:account_type]})
    else
      Profile.all
    end
  end

end