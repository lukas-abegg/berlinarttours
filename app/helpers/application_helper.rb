module ApplicationHelper
  def getHeader(current_page)

    if current_page.start_with?('/tourist_home')
      return 'intro imageTouristIntroBG'
    elsif current_page.start_with?('/tourist_profile')
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
    elsif current_page.start_with?('/tourist_profile')
      return ''
    elsif current_page.start_with?('/tourist_tours')
      return ''
    else
      return 'bg-body imageTouristProfileBG'
    end
  end

  def getHeaderText(current_page)

    if current_page.start_with?('/tourist_home')
      return 'header_texts.home'
    elsif current_page.start_with?('/tourist_profile')
      return 'header_texts.profile'
    elsif current_page.start_with?('/tourist_tours')
      return 'header_texts.tours'
    else
      #return 'header_texts.home'
    end
  end

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
