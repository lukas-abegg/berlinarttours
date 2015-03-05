class Profile_Poi
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Geocoder::Model::Mongoid

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

  field :location, type: Array

  field :user_id, type: Integer

  belongs_to :user

  geocoded_by :address, :coordinates => :location

  after_validation :geocode          # auto-fetch coordinates

  def address
    [street, house_number, postcode, city, country].compact.join(', ')
  end


  def self.search(search_poi)
    if search_poi
      if search_poi[:postcode].blank?
        if search_poi[:poi_type] == " "
          @profiles = Profile_Poi.where( { name: /#{search_poi[:name]}/,
                                           email: /#{search_poi[:email]}/,
                                           city: /#{search_poi[:city]}/,
                                           country: /#{search_poi[:country]}/ }
          )     rescue nil
        else
          @profiles = Profile_Poi.where( { name: /#{search_poi[:name]}/,
                                           email: /#{search_poi[:email]}/,
                                           poi_type: /#{search_poi[:poi_type]}/,
                                           city: /#{search_poi[:city]}/,
                                           country: /#{search_poi[:country]}/ }
          )     rescue nil
        end
      else
        if search_poi[:poi_type] == " "
          @profiles = Profile_Poi.where( { name: /#{search_poi[:name]}/,
                                           email: /#{search_poi[:email]}/,
                                           postcode: search_poi[:postcode],
                                           city: /#{search_poi[:city]}/,
                                           country: /#{search_poi[:country]}/ }
          )     rescue nil
        else
          @profiles = Profile_Poi.where( { name: /#{search_poi[:name]}/,
                                           email: /#{search_poi[:email]}/,
                                           poi_type: /#{search_poi[:poi_type]}/,
                                           postcode: search_poi[:postcode],
                                           city: /#{search_poi[:city]}/,
                                           country: /#{search_poi[:country]}/ }
          )     rescue nil
        end
      end

      if @profiles.nil?
        Profile_Poi.all
      else
        @profiles
      end
    else
      Profile_Poi.all
    end
  end

end