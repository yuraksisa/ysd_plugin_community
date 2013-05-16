require 'ui/ysd_ui_page'
require 'renders/ysd_profile_render'


module Sinatra
  #
  # Community helpers 
  #
  module CommunityHelpers
   
    #
    # Loads the profile page
    #
    def page_from_profile(profile, options={})

       profile_page = UI::Page.new(:title => profile.full_name, 
         :content => Renders::ProfileRender.new(profile, 
         self).render(options[:locals]))
      
       page(profile_page, options) 

    end

    #
    # Render a social profile action button
    #
    # @param [Hash] option
    #   Information to render the button
    #   
    #
    def render_profile_action_button(option)
    
      if option[:data_icon]
       profile_button = <<-PROFILE_BUTTON
         <div class="form-button #{option[:class]}"><a href="#{option[:link]}" data-icon=#{option[:data_icon]}></a></div>
         <span class="smaller_text">#{option[:text]}</span>
       PROFILE_BUTTON
      else
       profile_button = <<-PROFILE_BUTTON
          <div class="form-button #{option[:class]}"><a href="#{option[:link]}">#{option[:text]}</a></div>
       PROFILE_BUTTON
      end

      if String.method_defined?(:encode)
        profile_button.encode!('UTF-8')
      end
      
      profile_button
      
    end

  end
end