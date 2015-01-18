class Profile_Poi
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_mongoid_attached_file :avatar, :styles => {:medium => "500x500>", :thumb => "200x200>"}, cascade_callbacks: true
  do_not_validate_attachment_file_type :avatar

  has_mongoid_attached_file :profile_bg, :styles => {:medium => "1920x1280", :thumb => "1920x300>"}, cascade_callbacks: true
  do_not_validate_attachment_file_type :profile_bg

  has_mongoid_attached_file :gallery_pic1, :styles => {:medium => "1920x1280", :thumb => "1920x300>"}, cascade_callbacks: true
  do_not_validate_attachment_file_type :gallery_pic1

  has_mongoid_attached_file :gallery_pic2, :styles => {:medium => "1920x1280", :thumb => "1920x300>"}, cascade_callbacks: true
  do_not_validate_attachment_file_type :gallery_pic2

  has_mongoid_attached_file :gallery_pic3, :styles => {:medium => "1920x1280", :thumb => "1920x300>"}, cascade_callbacks: true
  do_not_validate_attachment_file_type :gallery_pic3

  field :email, type: String
  field :account_type, type: String
  field :name, type: String
  field :poi_type, type: String
  field :description, type: String
  field :mobile, type: String
  field :phone, type: String
  field :street, type: String
  field :house_number, type: Integer
  field :postcode, type: Integer
  field :city, type: String
  field :country, type: String

  field :user_id, type: Integer

  belongs_to :user

  def self.search(search_poi)
    #if search_poi
      #find(:all, :conditions => ['name LIKE ?', "%#{search_poi.first_name}%"])
      Profile.where(name: /#{search_poi[:first_name]}/)
      #Profile.where(name.matches("%#{search_poi[:first_name]}%"))
    #else
      Profile.all
    #end
  end

end