class ContactMailer < ActionMailer::Base
  default :from => "info@berlinarttours.de"

  def send_request(contact)
    @contact = contact
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    #mail(:to => "<#{user.email}>", :subject => "Thank you for your registration at Berlin Art Tours")
    mail(:to => "<lukas.abegg1@gmail.com>", :subject => "#{@contact.subject}")
  end
end

