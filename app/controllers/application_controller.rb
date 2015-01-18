class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Mongoid.logger.level = Logger::DEBUG
  Moped.logger.level = Logger::DEBUG

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    {locale: I18n.locale}
  end

  def respond_to_not_found(*types)
    return
    flash[:warning] = t(:msg_asset_not_available, asset)

    respond_to do |format|
      format.html { redirect_to :action => :index }
      format.js { render(:update) { |page| page.reload } }
      format.json { render :text => flash[:warning], :status => :not_found }
      format.xml { render :text => flash[:warning], :status => :not_found }
    end
  end

  private

  #devise routing
  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    @user = current_user
    @poi = Profile_Poi.where(:user_id => @user.id)
    @guide = Profile_Guide.where(:user_id => @user.id)
    @tourist = Profile.where(:user_id => @user.id)

    if !@poi.blank?
      profile_pois_show_path
    elsif !@guide.blank?
      profile_guides_show_path
    elsif !@tourist.blank?
      profiles_show_path
    else
      if session[:account_type] == "poi"
        profile_pois_new_path
      elsif session[:account_type] == "guide"
        profile_guides_new_path
      else
        profiles_new_path
      end
    end
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  def after_sign_out_path_for(resource)
    intro_index_path
  end

  def after_user_edit_path_for(resource)
    intro_index_path
  end
end
