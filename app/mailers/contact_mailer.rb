class ContactMailer < ActionMailer::Base
  default :from => "info@berlinarttours.de"

  def send_request(contact)
    @contact = contact
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    #mail(:to => "<#{user.email}>", :subject => "Thank you for your registration at Berlin Art Tours")
    mail(:to => "<lukas.abegg1@gmail.com>", :subject => "#{@contact.subject}")
  end

  def send_request_trip(contact, trip_request, trip)
    @contact = contact
    @trip_request = trip_request
    @trip = trip
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    #mail(:to => "<#{user.email}>", :subject => "Thank you for your registration at Berlin Art Tours")
    mail(:to => "<lukas.abegg1@gmail.com>", :subject => "#{@contact.subject}")
  end

  def trip_station_created(trip, trip_station)
    @trip = trip
    @trip_station = trip_station
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    #mail(:to => "<#{user.email}>", :subject => "Thank you for your registration at Berlin Art Tours")
    mail(:to => "<lukas.abegg1@gmail.com>", :subject => "Neue Tour: #{@trip.name} mit deinem POI angelegt")
  end

  def notify_trip_request_status_changed(profile, trip_request)
    @trip_request = trip_request
    @profile = profile
    @status = @trip_request.request_status

    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    #mail(:to => "<#{user.email}>", :subject => "Thank you for your registration at Berlin Art Tours")
    mail(:to => "<lukas.abegg1@gmail.com>", :subject => "Tour #{@trip_request.trip_name} Status geandert")
  end

  def notify_trip_deleted(profile, trip_request)
    @trip_request = trip_request
    @profile = profile


    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    #mail(:to => "<#{user.email}>", :subject => "Thank you for your registration at Berlin Art Tours")
    mail(:to => "<lukas.abegg1@gmail.com>", :subject => "Touranfrage #{@trip_request.trip_name} wurde geloescht")
  end
end

