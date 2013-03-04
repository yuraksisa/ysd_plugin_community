module Sinatra
  module YSD
    #
    # It's an extension for 
    #
    module CommunityProfile

      def self.registered(app)

        #
        # Shows our profile
        #
        app.get "/profile" do
    
          authorized! "/profile"
       
          if profile = user
            @current_profile = profile
            page_from_profile(profile)
          else
            logger.error "#{request.path_info} Recurso no encontrado"
            status 404
          end
      
        end    
    
        # -------------------- Show other profile ----------------------------
    
        #
        # Shows a profile
        #
        app.get "/profile/:id" do
    
          authorized! "/profile"
       
          if profile = Users::Profile.get(params[:id])
             page_from_profile(profile)
          else
            logger.error "#{request.path_info} Recurso no encontrado"
            status 404
          end
      
        end 

      end

    end # Community 
  end # YSD
end # Social        