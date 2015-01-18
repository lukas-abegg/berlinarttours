class Contact
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subject, type: String
  field :receiver_email, type: String
  field :receiver_name, type: String
  field :sender_email, type: String
  field :sender_name, type: String
  field :sender_account_type, type: String
  field :reason, type: String

end