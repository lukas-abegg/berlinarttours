module ApplicationHelper
  def getHeader(current_page)

    if current_page?(tourist_home_path) || current_page?(poi_home_path) || current_page?(guide_home_path)
      return 'intro imageTouristIntroBG'
    elsif current_page?(profiles_show_url)
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
    elsif current_page?(profiles_show_url)
      return ''
    elsif current_page.start_with?('/tourist_tours')  || current_page.start_with?('/trips')
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
    elsif current_page?(profiles_show_url)
      return 'header_texts.profile'
    elsif current_page.start_with?('/tourist_tours')   || current_page.start_with?('/trips')
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
    @user = current_user
    if Profile.where(:email => @user.email).blank?
      return "loggedIn.svg"
    else
      @profile = Profile.find_by(:email => @user.email)
      return @profile.avatar.url
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
