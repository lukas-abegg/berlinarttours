class Profile_Guide
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_mongoid_attached_file :avatar, :styles => {:medium => "500x500>", :thumb => "200x200>"}, cascade_callbacks: true
  do_not_validate_attachment_file_type :avatar

  has_mongoid_attached_file :profile_bg, :styles => {:medium => "1920x1280", :thumb => "1920x300>"}, cascade_callbacks: true
  do_not_validate_attachment_file_type :profile_bg


  field :email, type: String
  field :account_type, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :description, type: String
  field :experience, type: String
  field :trip_types, type: String
  field :mobile, type: String
  field :phone, type: String
  field :street, type: String
  field :house_number, type: Integer
  field :postcode, type: Integer
  field :city, type: String
  field :country, type: String

  field :user_id, type: Integer

  belongs_to :user

  def self.search(search_guide)
    if search_guide
      @profiles = Profile_Guide.where( first_name: /#{search_guide[:first_name]}/,
                                last_name: /#{search_guide[:last_name]}/,
                                email: /#{search_guide[:email]}/,
                                postcode: /#{search_guide[:postcode]}/,
                                city: /#{search_guide[:city]}/,
                                country: /#{search_guide[:country]}/
                                )     rescue nil

      if @profiles.nil?
        Profile_Guide.all
      else
        @profiles
      end
    else
      Profile_Guide.all
    end
  end

end