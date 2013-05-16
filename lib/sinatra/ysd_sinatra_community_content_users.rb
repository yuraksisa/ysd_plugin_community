require 'ysd_md_cms' unless defined?ContentManagerSystem::Content
require 'ysd_md_profile' unless defined?Users::Profile

module Sinatra
  
  module YSD

    #
    # This module is the responsible of joining users to contents
    #
    module JoinUsersToContent

      def self.registered(app)
 
        #
        # Join an user to the content
        #
        app.post '/join/user/content', :allowed_usergroups => ['user','staff'] do

          content = ContentManagerSystem::Content.get(params[:content_id])
          user = Users::Profile.get(params[:user_username])

          if content and user
            content.join(user)
            status 200
          else
            status 404
          end

        end

        #
        # Disjoin a user to the content
        #
        app.post '/disjoin/user/content', :allowed_usergroups => ['user','staff'] do 

          content = ContentManagerSystem::Content.get(params[:content_id])
          user = Users::Profile.get(params[:user_username])

          if content and user
            content.disjoin(user)
            status 200
          else
            status 404
          end

        end
  
      end
    end #JoinUsersToContent
  end #YSD
end #Sinatra