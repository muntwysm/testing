# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def logo
    @logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
    return @logo
  end

  # Return a title on a per-page basis.
  def title
    base_title = "MyTwitt App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end

