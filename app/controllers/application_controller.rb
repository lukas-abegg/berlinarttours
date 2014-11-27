class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Mongoid.logger.level = Logger::DEBUG
  Moped.logger.level = Logger::DEBUG

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  def respond_to_not_found(*types)
    return
    flash[:warning] = t(:msg_asset_not_available, asset)

    respond_to do |format|
      format.html { redirect_to :action => :index }
      format.js   { render(:update) { |page| page.reload } }
      format.json { render :text => flash[:warning], :status => :not_found }
      format.xml  { render :text => flash[:warning], :status => :not_found }
    end
  end

  private

  def render_not_found(exception)
    #log_error(exception)
    render :template => "/error/404.html.haml", :status => 404
  end

  def render_error(exception)
    #log_error(exception)
    render :template => "/error/500.html.haml", :status => 500
  end
end
