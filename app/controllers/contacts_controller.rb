class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    if ContactMailer.send_request(@contact).deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Thank you for your message!'
    else
      flash.now[:error] = 'Cannot send message.'
    end
    if @contact.sender_account_type == "POI"
      redirect_to(:controller => "profile_pois", :action => "search_guides")
    else
      redirect_to :back
    end
  end
end
