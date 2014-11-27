module ApplicationHelper
  def getHeader(current_page)

    if current_page.start_with?('/tourist_home')
      return 'intro imageTouristIntroBG'
    elsif current_page.start_with?('/tourist_profile')
      return 'intro imageTouristProfileBG'
    elsif current_page.start_with?('/tourist_tours')
      return 'intro imageTouristToursBG'
    else
      return 'intro imageTouristIntroBG'
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
      return 'header_texts.home'
    end
  end
end
