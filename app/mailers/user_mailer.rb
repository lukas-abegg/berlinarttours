class UserMailer < ActionMailer::Base
  default :from => "info@berlinarttours.de"

  def registration_confirmation(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    #mail(:to => "<#{user.email}>", :subject => "Thank you for your registration at Berlin Art Tours")
    mail(:to => "<lukas.abegg1@gmail.com>", :subject => "Thank you for your registration at Berlin Art Tours")
  end
end

