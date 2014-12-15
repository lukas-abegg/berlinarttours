module ApplicationHelper
  def getHeader(current_page)

    if current_page.start_with?('/tourist_home')
      return 'intro imageTouristIntroBG'
    elsif current_page?(profiles_show_url)
      return 'intro imageTouristProfileBG'
    elsif current_page.start_with?('/tourist_tours')
      return 'intro imageTouristToursBG'
    else
      return 'hidden'
    end
  end

  def getBackground(current_page)

    if current_page.start_with?('/tourist_home')
      return ''
    elsif current_page?(profiles_show_url)
      return ''
    elsif current_page.start_with?('/tourist_tours')
      return ''
    else
      return 'imageTouristToursBG' #bg-body improves may if doesn't work
    end
  end

  def getHeaderText(current_page)

    printf(current_page)

    if current_page.start_with?('/tourist_home')
      return 'header_texts.home'
    elsif current_page?(profiles_show_url)
      return 'header_texts.profile'
    elsif current_page.start_with?('/tourist_tours')
      return 'header_texts.tours'
    else
      #return 'header_texts.home'
    end
  end

  def get_profile(current_user)
    @user = current_user
    @profile = Profile.find_by(:email => @user.email)
    return @profile.avatar.url
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
               concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
               concat message
             end)
    end
    nil
  end
end
