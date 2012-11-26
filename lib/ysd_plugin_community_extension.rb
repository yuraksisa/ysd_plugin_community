require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Community Extension
#
module Huasi

  class CommunityExtension < Plugins::ViewListener

    # ========= Page Building ============
    
    #
    # It gets the style sheets defined in the module
    #
    # @param [Context]
    #
    # @return [Array]
    #   An array which contains the css resources used by the module
    #
    #def page_style(context={})
    #
    #  ['/community/css/community.css']
    #
    #end
            
    # ========= Routes ===================
    
    # routes
    #
    # Define the module routes, that is the url that allow to access the funcionality defined in the module
    #
    #
    def routes(context={})
    
      routes = [{:path => "/community",
                 :regular_expression => /^\/community/,
                 :title => 'Community',
                 :description => 'The community page',
                 :fit => 1,
                 :module => :contact}]
    
    end
 
  end #CommunityExtension
end #Social