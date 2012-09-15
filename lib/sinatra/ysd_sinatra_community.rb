module Sinatra
  module YSD
    #
    # It's an extension for 
    #
    module Community
  
      def self.registered(app)
    
        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'i18n')))       
        
        #
        # Gets the community (page)
        #
        app.get "/community" do
    
          #authorized! 
    
          load_page :community
    
        end
    
        # ===================== Utilities ==========================
      
        #
        # Serves static content from the extension
        #
        app.get "/community/*" do
          
           serve_static_resource(request.path_info.gsub(/^\/community/,''), File.join(File.dirname(__FILE__), '..', '..', 'static'), 'community')
                     
        end
    
    
      end
    end # Community 
  end # YSD
end # Social