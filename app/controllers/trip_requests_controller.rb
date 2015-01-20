class TripRequestsController < ApplicationController
  before_action :set_trip_request, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @trip_requests = TripRequest.all
    respond_with(@trip_requests)
  end

  def show
    respond_with(@trip_request)
  end

  def new
    @trip_request = TripRequest.new
    respond_with(@trip_request)
  end

  def edit
  end

  def create
    @trip_request = TripRequest.new(trip_request_params)
    @trip = Trip.find_by(:id => @trip_request.trip_id)
    @contact = Contact.new(params[:contact])
    ContactMailer.send_request_trip(@contact, @trip_request, @trip).deliver

    if @trip_request.save
      flash[:notice] = "Touranfrage erfolgreich versendet"
    else
      flash[:alert] = "Touranfrage konnte nicht versendet werden"
    end
    respond_to do |format|
      env["HTTP_REFERER"] += '#body'
      format.html { redirect_to profiles_search_guides_path(:id => @trip_request.tourist_id) }
      format.xml
    end
  end

  def update
    @trip_request.update(trip_request_params)

    respond_to do |format|
      env["HTTP_REFERER"] += '#body'
      format.html { redirect_to :back }
      format.xml
    end
  end

  def status_update
    @trip_status = params[:status]
    @trip_request = TripRequest.find_by(:id => params[:id])

    @trip_request.request_status =  @trip_status
    @trip_request.update

    @profile = Profile.find_by(:id => @trip_request.tourist_id)

    ContactMailer.notify_trip_request_status_changed(@profile, @trip_request).deliver

    respond_to do |format|
      env["HTTP_REFERER"] += '#body'
      format.html { redirect_to :back }
      format.xml
    end
  end


  def destroy
    @trip_request_infos = @trip_request
    @trip_request.destroy

    @profile = Profile_Guide.find_by(:email => @trip_request_infos.guide_email)
    ContactMailer.notify_trip_deleted(@profile, @trip_request_infos).deliver


    respond_to do |format|
      env["HTTP_REFERER"] += '#body'
      format.html { redirect_to :back }
      format.xml
    end
  end

  private
    def set_trip_request
      @trip_request = TripRequest.find(params[:id])
    end

    def trip_request_params
      params.require(:trip_request).permit(:trip_id, :request_status, :trip_name, :guide_name, :guide_email, :tourist_id, :tourist_name, :request_descr, :who_wants, :when, :notes)
    end
end
