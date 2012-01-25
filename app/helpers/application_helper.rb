module ApplicationHelper
   # Return a title on a per-page basis.
  def web_page_title
    base_title = "Ruby on Rails Tutorial Sample App" 
    if @title.nil?
    base_title
    else
    "#{base_title} | #{@title}" 
    end 
  end
  def logo
    @logo = image_tag("logo.png")
  end
end
