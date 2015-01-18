class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

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

  field :user_id, type: Integer

  belongs_to  :user

  def self.search(search_poi)
    if search_poi[:first_name]
      Profile.where(first_name: /#{search_poi[:first_name]}/, account_type: search_poi[:account_type])
      #Profile.where(first_name.matches("%#{search_poi[:first_name]}%"))
    else
      Profile.all
    end
  end

end