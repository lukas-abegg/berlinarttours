module ApplicationHelper
  def getHeader(current_page)

    if current_page?(tourist_home_path) || current_page?(poi_home_path) || current_page?(guide_home_path)
      return 'intro imageTouristIntroBG'
    elsif current_page?(profiles_show_url) || current_page.start_with?('/profile_guides/show') || current_page.start_with?('/profile_pois/')
      return 'intro imageTouristProfileBG'
    elsif current_page.start_with?('/tourist_tours') || current_page.start_with?('/trips')
      return 'intro imageTouristToursBG'
    else
      return 'hidden'
    end
  end

  def getBackground(current_page)

    if current_page?(tourist_home_path) || current_page?(poi_home_path) || current_page?(guide_home_path)
      return ''
    elsif current_page?(profiles_show_url) || current_page.start_with?('/profile_guides/show') || current_page.start_with?('/profile_pois/')
      return ''
    elsif current_page.start_with?('/tourist_tours') || current_page.start_with?('/trips')
      return ''
    else
      return 'imageTouristToursBG' #bg-body improves may if doesn't work
    end
  end

  def getHeaderText(current_page)

    if current_page?(tourist_home_path)
      return 'header_texts.tourist_home'
    elsif current_page?(poi_home_path)
      return 'header_texts.poi_home'
    elsif current_page?(guide_home_path)
      return 'header_texts.guide_home'
    elsif current_page?(profiles_show_url) || current_page.start_with?('/profile_guides/show') || current_page.start_with?('/profile_pois/')
      return 'header_texts.profile'
    elsif current_page.start_with?('/tourist_tours') || current_page.start_with?('/trips')
      return 'header_texts.tours'
    else
      #return 'header_texts.home'
    end
  end

  def get_current_home(current_user)
    @session_type = session[:account_type]
    case @session_type
      when "tourist" then
        return 'layouts/tourist_header'
      when "guide" then
        return 'layouts/guide_header'
      else
        return 'layouts/poi_header'
    end
  end

  def get_profile(current_user)
    @user_avatar = current_user
    if !@profile.blank? && @profile.user_id == @user_avatar.id
      return @profile.avatar.url
    else
      @session_type = session[:account_type]

      if @session_type == "poi"
        if Profile_Poi.where(:user_id => @user_avatar.id).blank?
          return "loggedIn.svg"
        else
          @profile_avatar = Profile_Poi.find_by(:user_id => @user_avatar.id)
          return @profile_avatar.avatar.url
        end
      elsif @session_type == "guide"
        if Profile_Guide.where(:user_id => @user_avatar.id).blank?
          return "loggedIn.svg"
        else
          @profile_avatar = Profile_Guide.find_by(:user_id => @user_avatar.id)
          return @profile_avatar.avatar.url
        end
      else
        if Profile.where(:user_id => @user_avatar.id).blank?
          return "loggedIn.svg"
        else
          @profile_avatar = Profile.find_by(:user_id => @user_avatar.id)
          return @profile_avatar.avatar.url
        end
      end
    end
  end

  def bootstrap_class_for flash_type
    {success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info"}[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
               concat content_tag(:button, 'x', class: "close", data: {dismiss: 'alert'})
               concat message
             end)
    end
    nil
  end

end
