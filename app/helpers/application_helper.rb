module ApplicationHelper
    #Return title on a per-page basis.
    
    def title
      base_title = "Starterize"
        if @title.nil?
            base_title
        else 
            "#{base_title} | #{@title}"
        end
    end
  
  def logo
    image_tag("logo.png", :alt => "Starterize", :class => "round")
  end
  
end
